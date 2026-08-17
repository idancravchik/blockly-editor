import os
import shutil
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock
import pytest
from fastapi.testclient import TestClient

from app.main import app
from app.compiler import run_compilation, CompilationException, TimeoutException

client = TestClient(app)

VALID_CODE = """
void setup() {
  pinMode(33, OUTPUT);
}
void loop() {
  digitalWrite(33, HIGH);
  delay(500);
  digitalWrite(33, LOW);
  delay(500);
}
"""

INVALID_CODE = """
void setup() {
  degitalWrite(33, HIGH);
}
"""


def test_health_check():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_compile_success_mocked():
    fake_bin = b"\x00\x01\x02\x03\x04\x05\x06\x07"
    with patch("app.main.run_compilation", return_value=fake_bin):
        response = client.post("/compile", json={"code": VALID_CODE})
        assert response.status_code == 200
        assert response.headers["content-type"] == "application/octet-stream"
        assert response.headers["content-disposition"] == 'attachment; filename="firmware.bin"'
        assert response.content == fake_bin


def test_compile_error_mocked():
    error_msg = "sketch.ino: In function 'void setup()':\nsketch.ino:3:3: error: 'degitalWrite' was not declared"
    with patch("app.main.run_compilation", side_effect=CompilationException("Compilation failed", error_msg, 400)):
        response = client.post("/compile", json={"code": INVALID_CODE})
        assert response.status_code == 400
        data = response.json()
        assert data["status"] == "error"
        assert data["message"] == "Compilation failed"
        assert "degitalWrite" in data["errors"]


def test_compile_empty_code():
    response = client.post("/compile", json={"code": ""})
    assert response.status_code == 422
    data = response.json()
    assert data["status"] == "error"
    assert data["message"] == "Invalid input"


def test_compile_code_size_exceeded():
    large_code = "a" * (64 * 1024 + 1)
    response = client.post("/compile", json={"code": large_code})
    assert response.status_code == 422
    data = response.json()
    assert data["status"] == "error"
    assert "exceeds maximum allowed size" in data["detail"]


def test_compile_timeout_mocked():
    with patch("app.main.run_compilation", side_effect=TimeoutException("Compilation timed out")):
        response = client.post("/compile", json={"code": VALID_CODE})
        assert response.status_code == 500
        data = response.json()
        assert data["status"] == "error"
        assert data["message"] == "Compilation timed out"


def test_compiler_pipeline_cleanup_on_error():
    """Verify that compiler cleans up temporary directories even if subprocess fails."""
    tmp_dirs_created = []

    def fake_subprocess_run(*args, **kwargs):
        # Inspect temp dir during run
        cmd = args[0]
        out_dir = cmd[cmd.index("--output-dir") + 1]
        work_dir = Path(out_dir).parent
        tmp_dirs_created.append(work_dir)
        mock_res = MagicMock()
        mock_res.returncode = 1
        mock_res.stderr = "Compiler error simulated"
        mock_res.stdout = ""
        return mock_res

    with patch("subprocess.run", side_effect=fake_subprocess_run):
        with pytest.raises(CompilationException):
            run_compilation(INVALID_CODE)

    assert len(tmp_dirs_created) == 1
    # Verify temp dir was deleted in finally block
    assert not tmp_dirs_created[0].exists()
