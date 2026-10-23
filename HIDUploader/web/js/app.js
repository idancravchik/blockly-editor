document.addEventListener('DOMContentLoaded', () => {
  const flasher = new Ch55xHidFlasher();

  const connectBtn = document.getElementById('connectBtn');
  const flashBtn = document.getElementById('flashBtn');
  const statusBadge = document.getElementById('statusBadge');
  const dropzone = document.getElementById('dropzone');
  const hexFileInput = document.getElementById('hexFileInput');
  const fileInfo = document.getElementById('fileInfo');
  const fileNameDisplay = document.getElementById('fileName');
  const fileSizeDisplay = document.getElementById('fileSize');

  const chipIdDisplay = document.getElementById('chipIdDisplay');
  const bootVerDisplay = document.getElementById('bootVerDisplay');
  const flashSizeDisplay = document.getElementById('flashSizeDisplay');

  const progressBar = document.getElementById('progressBar');
  const progressPercent = document.getElementById('progressPercent');
  const progressBytes = document.getElementById('progressBytes');
  const consoleLog = document.getElementById('consoleLog');
  const clearLogBtn = document.getElementById('clearLogBtn');

  const demoABtn = document.getElementById('demoABtn');
  const demoBBtn = document.getElementById('demoBBtn');

  // Serial Monitor Elements
  const serialConnectBtn = document.getElementById('serialConnectBtn');
  const serialResetBtn = document.getElementById('serialResetBtn');
  const serialClearBtn = document.getElementById('serialClearBtn');
  const serialTerminal = document.getElementById('serialTerminal');
  const serialStatusBadge = document.getElementById('serialStatusBadge');

  let currentHexContent = null;
  let currentFileName = null;

  let serialPort = null;
  let serialReader = null;
  let serialReading = false;

  function log(message, type = 'info') {
    const time = new Date().toLocaleTimeString();
    const entry = document.createElement('div');
    entry.className = `log-entry ${type}`;
    entry.textContent = `[${time}] ${message}`;
    consoleLog.appendChild(entry);
    consoleLog.scrollTop = consoleLog.scrollHeight;
  }

  function setStatus(text, badgeClass = '') {
    statusBadge.textContent = text;
    statusBadge.className = `status-badge ${badgeClass}`;
  }

  function updateProgress(percent, current = 0, total = 0) {
    progressBar.style.width = `${percent}%`;
    progressPercent.textContent = `${percent}%`;
    if (total > 0) {
      progressBytes.textContent = `${current} / ${total} bytes`;
    } else {
      progressBytes.textContent = '';
    }
  }

  function loadHexText(text, name) {
    try {
      const parsed = IntelHexParser.parse(text);
      currentHexContent = text;
      currentFileName = name;

      fileNameDisplay.textContent = name;
      fileSizeDisplay.textContent = `${parsed.endAddr} bytes (CRC16: 0x${parsed.crc16.toString(16).toUpperCase()})`;
      fileInfo.style.display = 'flex';

      flashBtn.disabled = !flasher.device || !flasher.device.opened;
      log(`Loaded firmware "${name}": ${parsed.endAddr} bytes, CRC: 0x${parsed.crc16.toString(16).toUpperCase()}`, 'success');
    } catch (e) {
      log(`Error parsing HEX: ${e.message}`, 'error');
      alert(`Invalid Intel HEX file: ${e.message}`);
    }
  }

  async function handleConnected() {
    const info = await flasher.hello();
    chipIdDisplay.textContent = flasher.device.productName || "Idan's DevBoard";
    bootVerDisplay.textContent = `v${info.version}.0`;
    flashSizeDisplay.textContent = `${info.maxFlash} bytes (11 KB)`;

    setStatus("Connected", "connected");
    connectBtn.textContent = "Connected ✓";
    log(`Connected to "${flasher.device.productName || "Idan's DevBoard"}" (VID: 0x1209, PID: 0xC55D)! Bootloader v${info.version}.0`, 'success');

    if (currentHexContent) {
      flashBtn.disabled = false;
    }
  }

  // Attempt auto-connect if device is already authorized
  setTimeout(async () => {
    try {
      if (await flasher.autoConnect()) {
        await handleConnected();
      }
    } catch (e) {
      console.warn("Auto-connect check:", e);
    }
  }, 100);

  // Connect Button
  connectBtn.addEventListener('click', async () => {
    try {
      log("Requesting USB HID device: Please click 'Idan\\'s DevBoard' in the popup list, then click Connect...");
      setStatus("Connecting...", "flashing");

      await flasher.connect();
      await handleConnected();
    } catch (err) {
      setStatus("Disconnected");
      log(`Connection failed: ${err.message}`, 'error');
      alert(err.message);
    }
  });

  // Drag and Drop File Handlers
  dropzone.addEventListener('click', () => hexFileInput.click());
  dropzone.addEventListener('dragover', (e) => {
    e.preventDefault();
    dropzone.classList.add('dragover');
  });
  dropzone.addEventListener('dragleave', () => dropzone.classList.remove('dragover'));
  dropzone.addEventListener('drop', (e) => {
    e.preventDefault();
    dropzone.classList.remove('dragover');
    if (e.dataTransfer.files.length > 0) {
      readFile(e.dataTransfer.files[0]);
    }
  });

  hexFileInput.addEventListener('change', (e) => {
    if (e.target.files.length > 0) {
      readFile(e.target.files[0]);
    }
  });

  function readFile(file) {
    if (!file.name.toLowerCase().endsWith('.hex')) {
      alert("Please select an Intel HEX (.hex) file.");
      return;
    }
    const reader = new FileReader();
    reader.onload = (event) => loadHexText(event.target.result, file.name);
    reader.readAsText(file);
  }

  // Demo Preset Buttons
  demoABtn.addEventListener('click', () => {
    loadHexText(DEMO_HEX_A, "demo_serial_a.hex (Sends 'A' every 1s)");
  });

  demoBBtn.addEventListener('click', () => {
    loadHexText(DEMO_HEX_B, "demo_serial_b.hex (Sends 'B' every 1s)");
  });

  // Program / Flash Button
  flashBtn.addEventListener('click', async () => {
    if (!currentHexContent) {
      alert("Please choose or select a firmware preset first.");
      return;
    }

    try {
      flashBtn.disabled = true;
      connectBtn.disabled = true;
      setStatus("Flashing...", "flashing");
      updateProgress(0);

      log(`Initiating flashing of ${currentFileName}...`);

      await flasher.flash(currentHexContent, (percent, current, total) => {
        updateProgress(percent, current, total);
        if (percent % 25 === 0 || percent === 100) {
          log(`Flashing progress: ${percent}% (${current}/${total} bytes)`);
        }
      });

      setStatus("Complete", "connected");
      log("Firmware flashing and CRC verification completed successfully!", "success");
      log("Board rebooted into new user sketch! Open Serial Monitor below to view output.", "success");
      alert("Flashing Successful! The board is now running your firmware.");
    } catch (err) {
      setStatus("Error");
      log(`Flashing failed: ${err.message}`, "error");
      alert(`Flashing error: ${err.message}`);
    } finally {
      flashBtn.disabled = false;
      connectBtn.disabled = false;
    }
  });

  clearLogBtn.addEventListener('click', () => {
    consoleLog.innerHTML = '';
  });

  // --- Web Serial Monitor Logic ---
  serialClearBtn.addEventListener('click', () => {
    serialTerminal.textContent = '';
  });

  if (serialResetBtn) {
    serialResetBtn.addEventListener('click', async () => {
      if (!serialPort || !serialPort.writable) {
        log("Cannot send reset: Open Serial Monitor first.", 'error');
        alert("Please click 'Open Serial Monitor' first to connect to the COM port.");
        return;
      }
      try {
        log("Sending Magic Byte (0xFE) to trigger jump to HID Bootloader...", 'info');
        const writer = serialPort.writable.getWriter();
        await writer.write(new Uint8Array([0xFE]));
        writer.releaseLock();
        log("Magic Byte sent! CH552 is disconnecting and entering HID Bootloader.", 'success');
      } catch (err) {
        log(`Failed to send reset: ${err.message}`, 'error');
      }
    });
  }

  serialConnectBtn.addEventListener('click', async () => {
    if (serialReading) {
      // Disconnect
      try {
        serialReading = false;
        if (serialReader) {
          await serialReader.cancel();
          serialReader.releaseLock();
        }
        if (serialPort) {
          await serialPort.close();
        }
      } catch (e) {
        console.error(e);
      }
      serialPort = null;
      serialStatusBadge.textContent = 'Closed';
      serialStatusBadge.className = 'status-badge';
      serialConnectBtn.textContent = '🔌 Open Serial Monitor';
      log("Serial monitor disconnected.");
      return;
    }

    if (!('serial' in navigator)) {
      alert("Web Serial is not supported in this browser. Please use Chrome or Edge on Desktop, or open Arduino Serial Monitor / PuTTY at 115200 baud.");
      return;
    }

    try {
      serialPort = await navigator.serial.requestPort();
      await serialPort.open({ baudRate: 115200 });
      serialReading = true;

      serialStatusBadge.textContent = 'Open (115200)';
      serialStatusBadge.className = 'status-badge connected';
      serialConnectBtn.textContent = 'Disconnect Serial';
      log("Serial monitor connected at 115200 baud!", 'success');

      const decoder = new TextDecoderStream();
      const readableStreamClosed = serialPort.readable.pipeTo(decoder.writable);
      serialReader = decoder.readable.getReader();

      while (serialReading) {
        const { value, done } = await serialReader.read();
        if (done) break;
        if (value) {
          serialTerminal.textContent += value;
          serialTerminal.scrollTop = serialTerminal.scrollHeight;
        }
      }
    } catch (e) {
      serialStatusBadge.textContent = 'Closed';
      serialStatusBadge.className = 'status-badge';
      serialConnectBtn.textContent = '🔌 Open Serial Monitor';
      log(`Serial monitor: ${e.message}`, 'error');
    }
  });
});
