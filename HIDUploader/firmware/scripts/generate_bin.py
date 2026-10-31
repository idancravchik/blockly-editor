import os
import sys

def ihx_to_bin_dict(ihx_path):
    memory = {}
    with open(ihx_path, 'r', encoding='ascii', errors='ignore') as f:
        for line in f:
            line = line.strip()
            if not line.startswith(':'):
                continue
            length = int(line[1:3], 16)
            addr = int(line[3:7], 16)
            rtype = int(line[7:9], 16)
            if rtype == 0:  # Data record
                data = bytes.fromhex(line[9:9 + length * 2])
                for i, b in enumerate(data):
                    memory[addr + i] = b
            elif rtype == 1:  # EOF
                break
    return memory

def write_intel_hex(records_dict, output_path):
    """Writes an ASCII Intel HEX file from address-byte dictionary."""
    sorted_addrs = sorted(records_dict.keys())
    if not sorted_addrs:
        return

    with open(output_path, 'w', encoding='ascii', newline='\n') as f:
        i = 0
        while i < len(sorted_addrs):
            chunk_addr = sorted_addrs[i]
            chunk_bytes = [records_dict[chunk_addr]]
            i += 1
            while i < len(sorted_addrs) and len(chunk_bytes) < 16:
                if sorted_addrs[i] == chunk_addr + len(chunk_bytes):
                    chunk_bytes.append(records_dict[sorted_addrs[i]])
                    i += 1
                else:
                    break
            
            # Form Intel HEX record
            length = len(chunk_bytes)
            rec_type = 0x00
            addr_h = (chunk_addr >> 8) & 0xFF
            addr_l = chunk_addr & 0xFF
            cksum = length + addr_h + addr_l + rec_type + sum(chunk_bytes)
            cksum = ((~cksum) + 1) & 0xFF
            
            data_hex = ''.join(f'{b:02X}' for b in chunk_bytes)
            f.write(f":{length:02X}{chunk_addr:04X}{rec_type:02X}{data_hex}{cksum:02X}\n")

        # EOF record
        f.write(":00000001FF\n")

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    firmware_dir = os.path.dirname(script_dir)
    build_dir = os.path.join(firmware_dir, 'build')
    ihx_path = os.path.join(build_dir, 'ch552_hid_bootloader.ihx')
    
    if not os.path.exists(ihx_path):
        print(f"Error: {ihx_path} not found")
        sys.exit(1)
        
    mem = ihx_to_bin_dict(ihx_path)
    if not mem:
        print("Error: Empty memory from IHX")
        sys.exit(1)
        
    min_addr = min(mem.keys())
    max_addr = max(mem.keys())
    print(f"IHX addresses: 0x{min_addr:04X} to 0x{max_addr:04X} (size {max_addr - min_addr + 1} bytes)")
    
    # Reset vector at 0x0000 jumping to bootloader at 0x2C00: LJMP 0x2C00
    mem_with_vector = dict(mem)
    mem_with_vector[0x0000] = 0x02  # LJMP
    mem_with_vector[0x0001] = 0x2C
    mem_with_vector[0x0002] = 0x00
    
    version_tag = "v2.1"
    
    # 0. Pure ASCII Intel HEX (with reset vector)
    path_hex_ver = os.path.join(build_dir, f'ch552_hid_bootloader_{version_tag}.hex')
    write_intel_hex(mem_with_vector, path_hex_ver)
    path_hex = os.path.join(build_dir, 'ch552_hid_bootloader.hex')
    write_intel_hex(mem_with_vector, path_hex)
    print(f"Created: {path_hex_ver} and {path_hex} (ASCII Intel HEX with LJMP 0x2C00 vector)")
    
    # 1. 14 KB Flash Image (0x0000 to 0x37FF = 14336 bytes)
    flash_14k = bytearray([0xFF] * 14336)
    # Reset vector
    flash_14k[0x0000] = 0x02
    flash_14k[0x0001] = 0x2C
    flash_14k[0x0002] = 0x00
    for addr, val in mem.items():
        if addr < 14336:
            flash_14k[addr] = val
    path_14k_ver = os.path.join(build_dir, f'ch552_hid_bootloader_{version_tag}.bin')
    with open(path_14k_ver, 'wb') as f:
        f.write(flash_14k)
    path_14k = os.path.join(build_dir, 'ch552_hid_bootloader.bin')
    with open(path_14k, 'wb') as f:
        f.write(flash_14k)
    print(f"Created: {path_14k_ver} and {path_14k} ({len(flash_14k)} bytes, 14 KB Flash Image)")
    
    # 2. 16 KB Full Flash Image (0x0000 to 0x3FFF = 16384 bytes)
    flash_16k = bytearray([0xFF] * 16384)
    flash_16k[0x0000] = 0x02
    flash_16k[0x0001] = 0x2C
    flash_16k[0x0002] = 0x00
    for addr, val in mem.items():
        if addr < 16384:
            flash_16k[addr] = val
    path_16k_ver = os.path.join(build_dir, f'ch552_hid_bootloader_{version_tag}_16k.bin')
    with open(path_16k_ver, 'wb') as f:
        f.write(flash_16k)
    path_16k = os.path.join(build_dir, 'ch552_hid_bootloader_16k.bin')
    with open(path_16k, 'wb') as f:
        f.write(flash_16k)
    print(f"Created: {path_16k_ver} and {path_16k} ({len(flash_16k)} bytes, 16 KB Full Image)")
    
    # 3. Bootloader Partition Only (0x2C00 to 0x37FF = 3072 bytes)
    boot_part = bytearray([0xFF] * 3072)
    for addr, val in mem.items():
        if 0x2C00 <= addr < 0x3800:
            boot_part[addr - 0x2C00] = val
    path_boot_ver = os.path.join(build_dir, f'ch552_hid_bootloader_{version_tag}_offset_0x2c00.bin')
    with open(path_boot_ver, 'wb') as f:
        f.write(boot_part)
    path_boot = os.path.join(build_dir, 'ch552_hid_bootloader_offset_0x2c00.bin')
    with open(path_boot, 'wb') as f:
        f.write(boot_part)
    print(f"Created: {path_boot_ver} and {path_boot} ({len(boot_part)} bytes, 3 KB Partition Image)")
    
    # 4. Packed Bootloader (only occupied bytes starting at 0x2C00)
    packed_len = max_addr - 0x2C00 + 1
    boot_packed = bytearray([0xFF] * packed_len)
    for addr, val in mem.items():
        if addr >= 0x2C00:
            boot_packed[addr - 0x2C00] = val
    path_packed_ver = os.path.join(build_dir, f'ch552_hid_bootloader_{version_tag}_packed.bin')
    with open(path_packed_ver, 'wb') as f:
        f.write(boot_packed)
    path_packed = os.path.join(build_dir, 'ch552_hid_bootloader_packed.bin')
    with open(path_packed, 'wb') as f:
        f.write(boot_packed)
    print(f"Created: {path_packed_ver} and {path_packed} ({len(boot_packed)} bytes, Packed Image)")

if __name__ == '__main__':
    main()
