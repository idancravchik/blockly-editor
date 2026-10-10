#!/usr/bin/env python3
"""
CH552 Driverless USB HID Command-Line Flasher
Programs CH552 microcontrollers running the HID bootloader without any drivers or Zadig.
"""

import sys
import time
import argparse

try:
    import hid
except ImportError:
    hid = None

VID = 0x1209
PID = 0xC55D

CMD_HELLO = 0x01
CMD_UNLOCK = 0x02
CMD_WRITE_BLOCK = 0x04
CMD_VERIFY_CRC = 0x05
CMD_REBOOT = 0x06

CHUNK_SIZE = 48
MAX_FLASH_SIZE = 11264  # 11 KB user partition


def parse_hex(filename):
    memory = bytearray([0xFF] * MAX_FLASH_SIZE)
    min_addr = MAX_FLASH_SIZE
    max_addr = 0
    ext_addr = 0

    with open(filename, 'r') as f:
        for line in f:
            line = line.strip()
            if not line.startswith(':'):
                continue

            byte_count = int(line[1:3], 16)
            address = int(line[3:7], 16) + ext_addr
            rec_type = int(line[7:9], 16)

            if rec_type == 0x01:
                break
            elif rec_type == 0x02:
                ext_addr = int(line[9:13], 16) << 4
            elif rec_type == 0x04:
                ext_addr = int(line[9:13], 16) << 16
            elif rec_type == 0x00:
                data = bytes.fromhex(line[9:9 + byte_count * 2])
                for i, b in enumerate(data):
                    t_addr = address + i
                    if t_addr >= MAX_FLASH_SIZE:
                        raise ValueError(f"Address 0x{t_addr:04X} exceeds available flash ({MAX_FLASH_SIZE} bytes)")
                    memory[t_addr] = b
                    if t_addr < min_addr:
                        min_addr = t_addr
                    if t_addr > max_addr:
                        max_addr = t_addr

    if max_addr < min_addr:
        min_addr = 0
        max_addr = 0

    length = max_addr + 1
    if length % 2 != 0:
        length += 1

    # CRC16-CCITT
    crc = 0xFFFF
    for i in range(length):
        crc ^= (memory[i] << 8)
        for _ in range(8):
            if crc & 0x8000:
                crc = ((crc << 1) ^ 0x1021) & 0xFFFF
            else:
                crc = (crc << 1) & 0xFFFF

    return memory[:length], length, crc


def parse_firmware(filename):
    if filename.lower().endswith('.bin'):
        with open(filename, 'rb') as f:
            raw = bytearray(f.read())
        if len(raw) > MAX_FLASH_SIZE:
            raise ValueError(f"Binary size ({len(raw)} bytes) exceeds available flash ({MAX_FLASH_SIZE} bytes)")
        length = len(raw)
        if length % 2 != 0:
            raw.append(0xFF)
            length += 1
        crc = 0xFFFF
        for i in range(length):
            crc ^= (raw[i] << 8)
            for _ in range(8):
                if crc & 0x8000:
                    crc = ((crc << 1) ^ 0x1021) & 0xFFFF
                else:
                    crc = (crc << 1) & 0xFFFF
        return raw, length, crc
    return parse_hex(filename)


class Ch55xDevice:
    def __init__(self, dev):
        self.dev = dev
        self.seq = 0

    def transceive(self, cmd, addr, payload=b'', timeout_ms=1000):
        packet = bytearray(64)
        current_seq = self.seq & 0xFF
        self.seq = (self.seq + 1) & 0xFF

        packet[0] = cmd
        packet[1] = current_seq
        packet[2] = addr & 0xFF
        packet[3] = (addr >> 8) & 0xFF
        packet[4] = len(payload)
        packet[5:5 + len(payload)] = payload

        # hidapi requires report ID prefix (0x00) on Windows
        self.dev.write(b'\x00' + packet)
        resp = self.dev.read(64, timeout_ms)

        if not resp or len(resp) < 60:
            raise TimeoutError(f"No response received for command 0x{cmd:02X}")

        return bytes(resp)

    def hello(self):
        resp = self.transceive(CMD_HELLO, 0)
        chip_id = resp[4]
        ver = resp[5]
        max_flash = resp[6] | (resp[7] << 8)
        status = resp[59]
        if status != 0:
            raise RuntimeError(f"CMD_HELLO failed with status 0x{status:02X}")
        return chip_id, ver, max_flash

    def unlock(self):
        token = bytes([0x5A, 0xC3, 0x3C, 0xA5])
        resp = self.transceive(CMD_UNLOCK, 0, token)
        if resp[59] != 0:
            raise RuntimeError("CMD_UNLOCK rejected by bootloader")

    def write_block(self, addr, chunk):
        resp = self.transceive(CMD_WRITE_BLOCK, addr, chunk)
        status = resp[59]
        if status != 0:
            raise RuntimeError(f"Write error at 0x{addr:04X}: status 0x{status:02X}")

    def verify_crc(self, end_addr, expected_crc):
        payload = bytes([expected_crc & 0xFF, (expected_crc >> 8) & 0xFF])
        resp = self.transceive(CMD_VERIFY_CRC, end_addr, payload)
        if resp[59] != 0:
            chip_crc = resp[4] | (resp[5] << 8)
            raise RuntimeError(f"CRC verification failed: chip=0x{chip_crc:04X}, expected=0x{expected_crc:04X}")

    def reboot(self):
        try:
            self.transceive(CMD_REBOOT, 0, timeout_ms=200)
        except Exception:
            pass


def main():
    parser = argparse.ArgumentParser(description="CH552 / Idan's DevBoard Driverless USB HID Programmer")
    parser.add_argument("firmware_file", help="Intel HEX (.hex) or binary (.bin) file to flash")
    args = parser.parse_args()

    if hid is None:
        print("Error: 'hid' library is required. Install via: pip install hidapi")
        sys.exit(1)

    print(f"Loading firmware: {args.firmware_file}...")
    firmware, length, expected_crc = parse_firmware(args.firmware_file)
    print(f"Firmware size: {length} bytes (CRC16: 0x{expected_crc:04X})")

    print(f"Searching for Idan's DevBoard / CH552 HID Bootloader (VID: 0x{VID:04X}, PID: 0x{PID:04X})...")
    try:
        dev = hid.device()
        dev.open(VID, PID)
    except Exception as e:
        print(f"Error: Could not open CH552 device ({e})")
        print("Tip: Ensure the board is in bootloader mode (hold Pin 32 to GND during plug-in).")
        sys.exit(1)

    try:
        flasher = Ch55xDevice(dev)
        chip_id, ver, max_flash = flasher.hello()
        print(f"Connected to CH552 (ID: 0x{chip_id:02X}, Bootloader v{ver}.0, Max Flash: {max_flash}B)")

        print("Unlocking Flash write engine...")
        flasher.unlock()

        print(f"Flashing {length} bytes...")
        offset = 0
        start_time = time.time()

        while offset < length:
            chunk = firmware[offset:offset + CHUNK_SIZE]
            flasher.write_block(offset, chunk)
            offset += len(chunk)

            percent = int((offset / length) * 100)
            sys.stdout.write(f"\rProgress: [{('=' * (percent // 2)).ljust(50)}] {percent}% ({offset}/{length} B)")
            sys.stdout.flush()

        duration = time.time() - start_time
        print(f"\nWrite completed in {duration:.2f}s ({length / duration / 1024:.2f} KB/s)")

        print("Verifying firmware integrity (CRC16)...")
        flasher.verify_crc(length, expected_crc)
        print("CRC Verified! 100% Match.")

        print("Rebooting device into application mode...")
        flasher.reboot()
        print("Done! Application running.")

    finally:
        dev.close()


if __name__ == "__main__":
    main()
