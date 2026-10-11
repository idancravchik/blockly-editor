from pydantic import BaseModel, Field, field_validator
from typing import Optional

MAX_CODE_SIZE_BYTES = 64 * 1024  # 64KB


class CompileRequest(BaseModel):
    code: str = Field(..., description="C / Arduino C++ code string to compile for CH552")
    format: Optional[str] = Field("bin", description="Output format: 'bin' or 'hex'")

    @field_validator("code")
    @classmethod
    def validate_code(cls, v: str) -> str:
        if not v or not v.strip():
            raise ValueError("Field 'code' cannot be empty.")
        encoded_bytes = v.encode("utf-8")
        if len(encoded_bytes) > MAX_CODE_SIZE_BYTES:
            raise ValueError(
                f"Field 'code' exceeds maximum allowed size of {MAX_CODE_SIZE_BYTES} bytes (64KB)."
            )
        return v

    @field_validator("format")
    @classmethod
    def validate_format(cls, v: Optional[str]) -> str:
        if not v:
            return "bin"
        v_clean = v.lower().strip()
        if v_clean not in ["bin", "hex"]:
            raise ValueError("Field 'format' must be either 'bin' or 'hex'.")
        return v_clean


class CompileErrorResponse(BaseModel):
    status: str = "error"
    message: str = "Compilation failed"
    errors: str


class ServerErrorResponse(BaseModel):
    status: str = "error"
    message: str
    detail: Optional[str] = None
