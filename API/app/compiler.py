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


def run_compilation(code: str) -> bytes:
    """
    Compiles Arduino C/C++ source code targeting the CH552 microcontroller using arduino-cli.
    
    Returns:
        bytes: The binary raw bytes of the generated binary/hex file.
        
    Raises:
        CompilationException: If compilation fails (exit code != 0).
        TimeoutException: If compilation takes longer than timeout limit.
        Exception: For unexpected file system or execution failures.
    """
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

        # Search for generated .bin, .hex, or any other output file inside output directory
        bin_files = list(out_dir.glob("*.bin")) + list(out_dir.glob("*.hex")) + list(out_dir.glob("*.cmd"))
        
        # Fallback to any generated file that is not a directory
        if not bin_files:
            bin_files = [f for f in out_dir.glob("*") if f.is_file()]

        if not bin_files:
            logger.error(f"[{request_id}] Compilation exit code 0 but no binary/hex file created in {out_dir}")
            raise Exception("Compilation reported success, but output binary file was not generated.")

        binary_path = bin_files[0]
        with open(binary_path, "rb") as f:
            binary_data = f.read()

        return binary_data

    finally:
        # Cleanup temporary workspace
        if work_dir.exists():
            try:
                shutil.rmtree(work_dir, ignore_errors=True)
                logger.info(f"[{request_id}] Cleaned up temp directory: {work_dir}")
            except Exception as e:
                logger.error(f"[{request_id}] Error cleaning up temp directory {work_dir}: {e}")
