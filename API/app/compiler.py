import logging
import os
import shutil
import subprocess
import tempfile
import uuid
from pathlib import Path
from typing import Tuple

logger = logging.getLogger(__name__)

ARDUINO_CLI_PATH = os.getenv("ARDUINO_CLI_PATH", "arduino-cli")
CH552_FQBN = os.getenv(
    "CH552_FQBN",
    "CH55xDuino:mcs51:ch552:clock=24internal,usb_settings=usbcdc"
)
COMPILATION_TIMEOUT_SECONDS = float(os.getenv("COMPILATION_TIMEOUT_SECONDS", "60.0"))

USB_PRODUCT_DESCRIPTOR_REPLACEMENT = """__code uint16_t ProductDescriptor[] = {
    // Product String Descriptor: "idan's DevBoard"
    (((15 + 1) * 2) | (DTYPE_String << 8)),
    'i',
    'd',
    'a',
    'n',
    '\\'',
    's',
    ' ',
    'D',
    'e',
    'v',
    'B',
    'o',
    'a',
    'r',
    'd',
};"""


def ensure_usb_product_descriptor() -> None:
    """
    Ensures that the CH55xduino core's USBconstant.c has the USB Product Descriptor
    configured as "idan's DevBoard".
    """
    candidates = [
        Path.home() / ".arduino15",
        Path("/root/.arduino15"),
        Path("/home"),
    ]
    local_app_data = os.getenv("LOCALAPPDATA")
    if local_app_data:
        candidates.append(Path(local_app_data) / "Arduino15")

    import re
    for base in candidates:
        if base.exists():
            for usb_file in base.glob("**/cores/ch55xduino/USBconstant.c"):
                try:
                    content = usb_file.read_text(encoding="utf-8", errors="ignore")
                    if "idan's DevBoard" not in content:
                        new_content = re.sub(
                            r"__code\s+uint16_t\s+ProductDescriptor\[\]\s*=\s*\{[^}]+\};",
                            USB_PRODUCT_DESCRIPTOR_REPLACEMENT,
                            content,
                        )
                        if new_content != content:
                            usb_file.write_text(new_content, encoding="utf-8")
                            logger.info(f"Set USB Product Descriptor to 'idan\\'s DevBoard' in {usb_file}")
                except Exception as e:
                    logger.warning(f"Could not update USBconstant.c at {usb_file}: {e}")


# Run on startup
try:
    ensure_usb_product_descriptor()
except Exception as e:
    logger.warning(f"Failed to verify USB product descriptor on startup: {e}")


class CompilationException(Exception):
    def __init__(self, message: str, errors: str, status_code: int = 400):
        self.message = message
        self.errors = errors
        self.status_code = status_code
        super().__init__(f"{message}: {errors}")


class TimeoutException(Exception):
    def __init__(self, message: str = "Compilation timed out", status_code: int = 500):
        self.message = message
        self.status_code = status_code
        super().__init__(message)


def intel_hex_to_bin(hex_str: str) -> bytes:
    """Converts ASCII Intel HEX string to raw binary bytes."""
    memory = {}
    max_addr = 0
    for line in hex_str.splitlines():
        line = line.strip()
        if not line.startswith(":"):
            continue
        try:
            length = int(line[1:3], 16)
            addr = int(line[3:7], 16)
            rtype = int(line[7:9], 16)
            if rtype == 0:  # Data record
                data = bytes.fromhex(line[9 : 9 + length * 2])
                for i, b in enumerate(data):
                    memory[addr + i] = b
                    if addr + i > max_addr:
                        max_addr = addr + i
            elif rtype == 1:  # EOF
                break
        except Exception:
            continue

    if not memory:
        return b""
    buf = bytearray([0xFF] * (max_addr + 1))
    for addr, val in memory.items():
        buf[addr] = val
    return bytes(buf)


def bin_to_intel_hex(bin_data: bytes) -> bytes:
    """Converts raw binary bytes to ASCII Intel HEX bytes."""
    lines = []
    chunk_size = 16
    for addr in range(0, len(bin_data), chunk_size):
        chunk = bin_data[addr : addr + chunk_size]
        length = len(chunk)
        rtype = 0x00
        addr_h = (addr >> 8) & 0xFF
        addr_l = addr & 0xFF
        cksum = length + addr_h + addr_l + rtype + sum(chunk)
        cksum = ((~cksum) + 1) & 0xFF
        data_hex = "".join(f"{b:02X}" for b in chunk)
        lines.append(f":{length:02X}{addr:04X}{rtype:02X}{data_hex}{cksum:02X}")
    lines.append(":00000001FF\n")
    return ("\n".join(lines)).encode("utf-8")


def run_compilation(code: str, output_format: str = "bin") -> Tuple[bytes, str]:
    """
    Compiles Arduino C/C++ source code targeting the CH552 microcontroller using arduino-cli.
    
    Args:
        code: Source code string to compile.
        output_format: 'bin' for raw binary bytes, or 'hex' for Intel HEX format.
        
    Returns:
        Tuple[bytes, str]: A tuple of (file_bytes, filename) where filename is 'firmware.bin' or 'firmware.hex'.
        
    Raises:
        CompilationException: If compilation fails (exit code != 0).
        TimeoutException: If compilation takes longer than timeout limit.
        Exception: For unexpected file system or execution failures.
    """
    ensure_usb_product_descriptor()
    fmt = (output_format or "bin").lower().strip()
    if fmt not in ["bin", "hex"]:
        fmt = "bin"
    request_id = str(uuid.uuid4())
    
    base_tmp_str = os.getenv("TMPDIR") or ("/tmp" if os.path.exists("/tmp") else tempfile.gettempdir())
    base_tmp = Path(base_tmp_str)
    
    work_dir = base_tmp / request_id
    sketch_dir = work_dir / "sketch"
    out_dir = work_dir / "out"
    sketch_file = sketch_dir / "sketch.ino"

    try:
        sketch_dir.mkdir(parents=True, exist_ok=True)
        out_dir.mkdir(parents=True, exist_ok=True)

        with open(sketch_file, "w", encoding="utf-8") as f:
            f.write(code)

        cmd = [
            ARDUINO_CLI_PATH,
            "compile",
            "--fqbn", CH552_FQBN,
            "--output-dir", str(out_dir),
            str(sketch_dir)
        ]

        logger.info(f"[{request_id}] Executing: {' '.join(cmd)}")

        try:
            process = subprocess.run(
                cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                timeout=COMPILATION_TIMEOUT_SECONDS
            )
        except subprocess.TimeoutExpired:
            logger.warning(f"[{request_id}] Compilation subprocess timed out after {COMPILATION_TIMEOUT_SECONDS}s")
            raise TimeoutException(f"Compilation timed out after {COMPILATION_TIMEOUT_SECONDS} seconds")

        if process.returncode != 0:
            error_output = process.stderr.strip() or process.stdout.strip() or "Compilation failed without output"
            logger.warning(f"[{request_id}] Compilation failed: {error_output}")
            raise CompilationException(
                message="Compilation failed",
                errors=error_output,
                status_code=400
            )

        hex_files = list(out_dir.glob("*.hex"))
        bin_files = list(out_dir.glob("*.bin"))

        if fmt == "hex":
            if hex_files:
                file_data = hex_files[0].read_bytes()
            elif bin_files:
                file_data = bin_to_intel_hex(bin_files[0].read_bytes())
            else:
                other_files = [f for f in out_dir.glob("*") if f.is_file()]
                if not other_files:
                    raise Exception("Compilation reported success, but output file was not generated.")
                file_data = other_files[0].read_bytes()
            return file_data, "firmware.hex"
        else:  # bin
            if bin_files:
                file_data = bin_files[0].read_bytes()
            elif hex_files:
                hex_str = hex_files[0].read_text(encoding="ascii", errors="ignore")
                file_data = intel_hex_to_bin(hex_str)
                if not file_data:
                    file_data = hex_files[0].read_bytes()
            else:
                other_files = [f for f in out_dir.glob("*") if f.is_file()]
                if not other_files:
                    raise Exception("Compilation reported success, but output file was not generated.")
                file_data = other_files[0].read_bytes()
            return file_data, "firmware.bin"

    finally:
        # Cleanup temporary workspace
        if work_dir.exists():
            try:
                shutil.rmtree(work_dir, ignore_errors=True)
                logger.info(f"[{request_id}] Cleaned up temp directory: {work_dir}")
            except Exception as e:
                logger.error(f"[{request_id}] Error cleaning up temp directory {work_dir}: {e}")
