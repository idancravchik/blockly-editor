/**
 * CH55x USB HID Flasher Library
 * Standalone client for flashing CH552 microcontrollers via WebHID.
 */
class Ch55xHidFlasher {
  static VID = 0x1209;
  static PID = 0xC55D;

  static CMD_HELLO = 0x01;
  static CMD_UNLOCK = 0x02;
  static CMD_ERASE = 0x03;
  static CMD_WRITE_BLOCK = 0x04;
  static CMD_VERIFY_CRC = 0x05;
  static CMD_REBOOT = 0x06;

  static CHUNK_SIZE = 48; // Max payload per 64-byte report

  constructor() {
    this.device = null;
    this.seq = 0;
    this.pendingResolvers = new Map();
  }

  /**
   * Checks if WebHID API is supported in the current browser.
   */
  static isSupported() {
    return typeof navigator !== 'undefined' && 'hid' in navigator;
  }

  /**
   * Prompts user to select a CH552 device and opens the HID connection.
   */
  async connect() {
    if (!Ch55xHidFlasher.isSupported()) {
      throw new Error("WebHID is not supported in this browser. Please open in Google Chrome, Microsoft Edge, or Opera.");
    }

    const devices = await navigator.hid.requestDevice({
      filters: [
        { vendorId: Ch55xHidFlasher.VID, productId: Ch55xHidFlasher.PID },
        { vendorId: Ch55xHidFlasher.VID }
      ]
    });

    if (!devices || devices.length === 0) {
      throw new Error("No device selected. In Chrome's popup, please click on 'Idan's DevBoard' to highlight it, then click Connect.");
    }

    this.device = devices[0];
    if (!this.device.opened) {
      await this.device.open();
    }

    this._setupInputReport();
    return this.device;
  }

  /**
   * Attempts automatic reconnection if permission was already granted previously.
   */
  async autoConnect() {
    if (!Ch55xHidFlasher.isSupported()) return false;
    try {
      const devices = await navigator.hid.getDevices();
      const match = devices.find(d => d.vendorId === Ch55xHidFlasher.VID);
      if (match) {
        this.device = match;
        if (!this.device.opened) {
          await this.device.open();
        }
        this._setupInputReport();
        return true;
      }
    } catch (e) {
      console.warn("Auto-connect failed:", e);
    }
    return false;
  }

  _setupInputReport() {
    this.device.oninputreport = (event) => {
      const data = new Uint8Array(event.data.buffer);
      const cmd = data[0];
      const seq = data[1];
      const key = `${cmd}_${seq}`;

      if (this.pendingResolvers.has(key)) {
        const resolve = this.pendingResolvers.get(key);
        this.pendingResolvers.delete(key);
        resolve(data);
      }
    };
  }

  /**
   * Sends a 64-byte report and awaits response from the CH552.
   */
  async sendReport(cmd, addr, payload = [], timeoutMs = 1500) {
    if (!this.device || !this.device.opened) {
      throw new Error("Device is not connected.");
    }

    const currentSeq = (this.seq++) & 0xFF;
    const packet = new Uint8Array(64);
    packet[0] = cmd;
    packet[1] = currentSeq;
    packet[2] = addr & 0xFF;
    packet[3] = (addr >> 8) & 0xFF;
    packet[4] = payload.length;

    for (let i = 0; i < payload.length; i++) {
      packet[5 + i] = payload[i];
    }

    const key = `${cmd}_${currentSeq}`;

    const responsePromise = new Promise((resolve, reject) => {
      const timer = setTimeout(() => {
        this.pendingResolvers.delete(key);
        reject(new Error(`Timeout waiting for response to command 0x${cmd.toString(16)} (seq ${currentSeq})`));
      }, timeoutMs);

      this.pendingResolvers.set(key, (resp) => {
        clearTimeout(timer);
        resolve(resp);
      });
    });

    // Send Report (Report ID 0)
    await this.device.sendReport(0, packet);
    return await responsePromise;
  }

  /**
   * Queries chip information.
   */
  async hello() {
    const resp = await this.sendReport(Ch55xHidFlasher.CMD_HELLO, 0);
    const chipId = resp[4];
    const version = resp[5];
    const maxFlash = resp[6] | (resp[7] << 8);
    const status = resp[59];

    if (status !== 0x00) {
      throw new Error(`CMD_HELLO failed with status code 0x${status.toString(16)}`);
    }

    return { chipId, version, maxFlash };
  }

  /**
   * Unlocks the IAP flash write engine.
   */
  async unlock() {
    const token = [0x5A, 0xC3, 0x3C, 0xA5];
    const resp = await this.sendReport(Ch55xHidFlasher.CMD_UNLOCK, 0, token);
    const status = resp[59];

    if (status !== 0x00) {
      throw new Error("CMD_UNLOCK failed: Authorization key rejected by bootloader.");
    }
  }

  /**
   * Erases the user flash partition (up to totalBytes, or all if 0).
   */
  async erase(totalBytes = 0) {
    const resp = await this.sendReport(Ch55xHidFlasher.CMD_ERASE, totalBytes, []);
    const status = resp[59];

    if (status !== 0x00 && status !== 0xFF) {
      throw new Error(`CMD_ERASE failed with status 0x${status.toString(16)}.`);
    }
  }

  /**
   * Writes a block of firmware bytes to flash memory.
   */
  async writeBlock(addr, chunk) {
    const resp = await this.sendReport(Ch55xHidFlasher.CMD_WRITE_BLOCK, addr, chunk);
    const status = resp[59];

    if (status === 0x02) throw new Error("Flash write failed: Device is locked.");
    if (status === 0x03) throw new Error("Flash write failed: Address out of bounds (bootloader protected).");
    if (status === 0x04) throw new Error(`Flash write error at address 0x${addr.toString(16)}.`);
    if (status !== 0x00) throw new Error(`Flash write failed with status 0x${status.toString(16)}.`);
  }

  /**
   * Verifies firmware integrity via chip CRC16 check.
   */
  async verifyCRC(endAddr, expectedCrc) {
    const payload = [expectedCrc & 0xFF, (expectedCrc >> 8) & 0xFF];
    const resp = await this.sendReport(Ch55xHidFlasher.CMD_VERIFY_CRC, endAddr, payload);
    const status = resp[59];
    const chipCrc = resp[4] | (resp[5] << 8);

    if (status !== 0x00) {
      throw new Error(`CRC verification mismatch! Chip CRC: 0x${chipCrc.toString(16)}, Expected: 0x${expectedCrc.toString(16)}`);
    }
    return chipCrc;
  }

  /**
   * Reboots the microcontroller into user application.
   */
  async reboot() {
    try {
      await this.sendReport(Ch55xHidFlasher.CMD_REBOOT, 0, [], 500);
    } catch (e) {
      // Device immediately detaches on reboot, ignoring timeout
    }
    if (this.device && this.device.opened) {
      await this.device.close();
    }
  }

  /**
   * High-level flashing pipeline.
   * @param {string|Uint8Array} firmware - Intel HEX string or raw binary Uint8Array.
   * @param {function} onProgress - Callback (percent, currentBytes, totalBytes).
   * @param {function} onStatus - Callback (statusMessage).
   */
  async flash(firmware, onProgress = () => {}, onStatus = () => {}) {
    onStatus("Connecting to CH552 HID bootloader...");
    if (!this.device || !this.device.opened) {
      await this.connect();
    }

    onStatus("Querying chip info (CMD_HELLO)...");
    const info = await this.hello();
    onStatus(`Detected chip 0x${info.chipId.toString(16)} (v${info.version}.0, usable flash: ${info.maxFlash} bytes)`);

    let binData;
    let expectedCrc;
    let totalLength;

    if (typeof firmware === 'string') {
      onStatus("Parsing Intel HEX firmware file...");
      const parsed = IntelHexParser.parse(firmware, info.maxFlash);
      binData = parsed.data;
      expectedCrc = parsed.crc16;
      totalLength = parsed.endAddr;
    } else {
      binData = firmware;
      totalLength = binData.length;
      expectedCrc = 0;
    }

    onStatus("Unlocking IAP Flash engine...");
    await this.unlock();

    onStatus("Erasing user Flash partition...");
    await this.erase(0);

    onStatus(`Flashing ${totalLength} bytes to Flash ROM...`);
    let offset = 0;

    while (offset < totalLength) {
      const remaining = totalLength - offset;
      const chunkSize = Math.min(remaining, Ch55xHidFlasher.CHUNK_SIZE);
      const chunk = binData.subarray(offset, offset + chunkSize);

      await this.writeBlock(offset, chunk);
      offset += chunkSize;

      const percent = Math.round((offset / totalLength) * 100);
      onProgress(percent, offset, totalLength);
    }

    onStatus("Verifying written firmware integrity (CRC16)...");
    await this.verifyCRC(totalLength, expectedCrc);
    onStatus("Verification succeeded! CRC Match.");

    onStatus("Rebooting device into application mode...");
    await this.reboot();
    onStatus("Flashing completed successfully! Device online.");
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = Ch55xHidFlasher;
}
