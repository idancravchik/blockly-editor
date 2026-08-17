import logging
from fastapi import FastAPI, Request, Response, status
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from app.schemas import CompileRequest, CompileErrorResponse, ServerErrorResponse
from app.compiler import run_compilation, CompilationException, TimeoutException

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
)
logger = logging.getLogger("ch552_compiler_api")

app = FastAPI(
    title="CH552 Build Microservice",
    description="Stateless microservice to compile C/Arduino C++ code for CH552 microcontrollers.",
    version="1.0.0"
)


@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request: Request, exc: RequestValidationError):
    """Formats validation errors (e.g. missing fields, exceeding 64KB size) to HTTP 422 JSON."""
    error_messages = []
    for err in exc.errors():
        msg = err.get("msg", "Invalid value")
        loc = " -> ".join(str(l) for l in err.get("loc", []))
        error_messages.append(f"{loc}: {msg}")
    
    return JSONResponse(
        status_code=422,
        content={
            "status": "error",
            "message": "Invalid input",
            "detail": "; ".join(error_messages)
        }
    )


@app.exception_handler(CompilationException)
async def compilation_exception_handler(request: Request, exc: CompilationException):
    """Formats compiler errors to HTTP 400 Bad Request JSON."""
    return JSONResponse(
        status_code=status.HTTP_400_BAD_REQUEST,
        content={
            "status": "error",
            "message": exc.message,
            "errors": exc.errors
        }
    )


@app.exception_handler(TimeoutException)
async def timeout_exception_handler(request: Request, exc: TimeoutException):
    """Formats timeout errors to HTTP 500 Internal Server Error JSON."""
    return JSONResponse(
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
        content={
            "status": "error",
            "message": exc.message,
            "detail": "Compilation request exceeded execution timeout limit (5 seconds)."
        }
    )


@app.exception_handler(Exception)
async def generic_exception_handler(request: Request, exc: Exception):
    """Catch-all handler for unexpected internal errors."""
    logger.error(f"Unhandled server error: {exc}", exc_info=True)
    return JSONResponse(
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
        content={
            "status": "error",
            "message": "Internal server error",
            "detail": str(exc)
        }
    )


@app.get("/health")
async def health_check():
    """Health check endpoint."""
    return {"status": "ok", "service": "CH552 Build Microservice"}


@app.post(
    "/compile",
    responses={
        200: {
            "content": {"application/octet-stream": {}},
            "description": "Raw binary (.bin) file download."
        },
        400: {"model": CompileErrorResponse, "description": "Compilation error"},
        422: {"model": ServerErrorResponse, "description": "Invalid input payload"},
        500: {"model": ServerErrorResponse, "description": "Server or timeout error"}
    }
)
async def compile_code(payload: CompileRequest):
    """
    Compiles Arduino C/C++ source code for CH552 microcontroller.
    
    On success: returns HTTP 200 with octet-stream bytes of firmware.bin.
    On compilation error: returns HTTP 400 JSON.
    """
    binary_bytes = run_compilation(payload.code)
    
    return Response(
        content=binary_bytes,
        media_type="application/octet-stream",
        headers={
            "Content-Disposition": 'attachment; filename="firmware.bin"'
        }
    )
