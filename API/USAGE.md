# Compilation API — Complete Usage Guide

Comprehensive integration and usage guide for the **CH552 Build Microservice** (`Compilation API`), a stateless cloud & local compiler service tailored for the **DevboxV1** ecosystem and WCH CH552 / CH552G microcontrollers.

---

## 📑 Table of Contents

1. [Overview & Architecture](#1-overview--architecture)
2. [Service Endpoints](#2-service-endpoints)
   - [Public & Local Base URLs](#public--local-base-urls)
   - [Interactive API Docs](#interactive-api-docs)
   - [`GET /health`](#get-health)
   - [`POST /compile`](#post-compile)
3. [Request & Response Specification](#3-request--response-specification)
   - [Payload Formats (`application/json` vs `text/plain`)](#payload-formats)
   - [Success Response (`200 OK`)](#success-response-200-ok)
   - [Error Responses (`400`, `422`, `500`)](#error-responses)
4. [Compiler Pipeline & Special Features](#4-compiler-pipeline--special-features)
   - [Automatic Student Wrapper Injection](#automatic-student-wrapper-injection)
   - [Target Board Configuration (FQBN)](#target-board-configuration-fqbn)
   - [Sandboxing & Resource Isolation](#sandboxing--resource-isolation)
5. [Code Examples by Language & Environment](#5-code-examples-by-language--environment)
   - [Browser / Frontend JavaScript (Vanilla Fetch & Blob)](#1-browser--frontend-javascript-vanilla-fetch--blob)
   - [Browser / WebHID In-Memory Flashing Integration](#2-browser--webhid-in-memory-flashing-integration)
   - [Node.js (TypeScript / ES Module)](#3-nodejs-typescript--es-module)
   - [Python (`requests` & `httpx`)](#4-python-requests--httpx)
   - [cURL / Command Line](#5-curl--command-line)
   - [Android / Kotlin (`OkHttp`)](#6-android--kotlin-okhttp)
6. [DevboxV1 End-to-End Workflow](#6-devboxv1-end-to-end-workflow)
7. [Environment Variables & Configuration](#7-environment-variables--configuration)
8. [Local Development & Self-Hosting](#8-local-development--self-hosting)
   - [Prerequisites](#prerequisites)
   - [Running with Uvicorn](#running-with-uvicorn)
   - [Running with Docker](#running-with-docker)
   - [Executing Unit Tests](#executing-unit-tests)
9. [Troubleshooting & FAQ](#9-troubleshooting--faq)

---

## 1. Overview & Architecture

The **Compilation API** is a lightweight, stateless microservice built on **FastAPI** and **arduino-cli**. It accepts raw C or Arduino C++ source code, compiles it against the **CH55xDuino** core targeting the **WCH CH552 (8051 MCS-51)** microcontroller, and returns ready-to-flash binary bytes (`firmware.bin`).

```
┌─────────────────────────────────┐
│     Client Application          │
│ (Devbox Block Editor / WebHID / │
│   Android App / CLI Script)     │
└───────────────┬─────────────────┘
                │
                │ POST /compile { "code": "..." }
                ▼
┌─────────────────────────────────────────────────────────┐
│              Compilation API (FastAPI)                  │
│                                                         │
│ 1. Validate payload (≤ 64 KB, non-empty)                │
│ 2. Create isolated sandbox: /tmp/{uuid}/                │
│ 3. Enforce USB Product Descriptor: "idan's DevBoard"    │
│ 4. Execute arduino-cli compile --fqbn CH55xDuino:...    │
│ 5. Read generated .bin file                             │
│ 6. Destroy /tmp/{uuid}/ directory (try...finally)       │
└───────────────┬─────────────────────────────────────────┘
                │
                │ 200 OK (Content-Type: application/octet-stream)
                ▼
┌─────────────────────────────────┐
│         firmware.bin            │
│ (Flashed via USB HID Bootloader)│
└─────────────────────────────────┘
```

### Key Highlights
- **Stateless Execution:** Zero shared state between requests. Every compilation job runs in a dedicated UUID workspace.
- **Preflight-Free Web Compatibility:** Full CORS support (`*`) and dual content-type support (`application/json` and `text/plain`), avoiding browser CORS preflight `OPTIONS` blocks on restricted networks.
- **Standard Regular Code:** Native compilation of standard C / Arduino C++ code (`void setup()` and `void loop()`) with no artificial wrappers or function mutations.
- **Custom USB Device Descriptor:** Target firmware automatically enumerates as **`idan's DevBoard`** via USB string descriptors.
- **Built-in USB CDC & Reset:** Target firmware is compiled with internal 24 MHz oscillator and USB CDC support with automatic 1200-baud bootloader reset.

---

## 2. Service Endpoints

### Public & Local Base URLs

| Environment | Base URL | Status |
| :--- | :--- | :--- |
| **Production (Render)** | `https://web-compiler-api.onrender.com` | Live Cloud Microservice |
| **Local Development** | `http://localhost:8000` | Local Uvicorn / Docker instance |

> [!NOTE]
> On the free tier of cloud hosting (e.g. Render), instances spin down after inactivity. The first request may take 30–50 seconds to wake up (cold start). Keep-alive pings against `/health` can keep the container warm.

### Interactive API Docs

When running locally or querying the hosted instance, interactive API documentation is automatically available:
- **Swagger UI:** `http://localhost:8000/docs` (or `<BASE_URL>/docs`)
- **ReDoc UI:** `http://localhost:8000/redoc` (or `<BASE_URL>/redoc`)
- **OpenAPI Schema:** `http://localhost:8000/openapi.json`

---

### `GET /health`

Lightweight liveness probe to verify service health and prevent cold starts.

#### Request
```http
GET /health HTTP/1.1
Host: web-compiler-api.onrender.com
```

#### Response (`200 OK`)
```json
{
  "status": "ok",
  "service": "CH552 Build Microservice"
}
```

---

### `POST /compile`

Primary compilation endpoint. Receives source code and returns the compiled binary or Intel HEX firmware.

#### Query Parameters
- `format` *(optional)*: Output file format — `'bin'` (default) or `'hex'`.
  - `POST /compile?format=bin` $\rightarrow$ downloads `firmware.bin`
  - `POST /compile?format=hex` $\rightarrow$ downloads `firmware.hex`

#### Request Headers
- `Content-Type`: `application/json` (recommended) or `text/plain`
- `Accept`: `application/octet-stream, text/plain, application/json`

#### Request Body
```json
{
  "code": "void setup() {\n  pinMode(33, OUTPUT);\n}\nvoid loop() {\n  digitalWrite(33, HIGH);\n  delay(500);\n  digitalWrite(33, LOW);\n  delay(500);\n}",
  "format": "bin"
}
```
*(The `"format"` field inside JSON is optional; can be `"bin"` or `"hex"`).*

---

## 3. Request & Response Specification

### Payload Formats

The API supports two request formats on `POST /compile`:

1. **Standard JSON (`application/json`):**
   ```json
   {
     "code": "#include <Arduino.h>\nvoid setup() {} void loop() {}",
     "format": "hex"
   }
   ```
2. **Plain Text (`text/plain`):**
   The raw source code can be sent directly as text or as a raw JSON string. When using plain text, the output format can be specified via the query parameter (e.g. `/compile?format=hex`). This prevents browsers from issuing CORS preflight `OPTIONS` requests when cross-origin limitations are strict.

#### Constraints
- **Maximum Code Size:** **64 KB (65,536 bytes)**. Code larger than 64 KB returns `HTTP 422`.
- **Minimum Code Size:** Non-empty string. Empty or whitespace-only code returns `HTTP 422`.
- **Supported Output Formats:** `'bin'` (raw binary bytes) or `'hex'` (ASCII Intel HEX).
- **Execution Timeout:** **5.0 – 60.0 seconds** (configurable via environment variables; default 5s in Docker container).

---

### Success Response (`200 OK`)

Returned when `arduino-cli` completes with exit code `0`.

#### When requesting BIN format (`format=bin` or default):
- **HTTP Status:** `200 OK`
- **Content-Type:** `application/octet-stream`
- **Content-Disposition:** `attachment; filename="firmware.bin"`
- **Response Body:** Raw binary bytes of the flash image (`.bin`).

#### When requesting HEX format (`format=hex`):
- **HTTP Status:** `200 OK`
- **Content-Type:** `text/plain; charset=utf-8`
- **Content-Disposition:** `attachment; filename="firmware.hex"`
- **Response Body:** ASCII Intel HEX format records (`:10...`).

---

### Error Responses

All error responses return structured JSON messages:

#### 1. Compilation Error (`HTTP 400 Bad Request`)
Occurs when the submitted code contains syntax errors, missing includes, or unresolvable symbols.

```json
{
  "status": "error",
  "message": "Compilation failed",
  "errors": "sketch.ino: In function 'void loop()':\nsketch.ino:6:3: error: 'degitalWrite' was not declared in this scope\n   degitalWrite(33, HIGH);\n   ^~~~~~~~~~~~"
}
```

#### 2. Validation Error (`HTTP 422 Unprocessable Entity`)
Occurs when the payload is missing, empty, malformed, or exceeds 64 KB.

```json
{
  "status": "error",
  "message": "Invalid input",
  "detail": "Field 'code' exceeds maximum allowed size of 65536 bytes (64KB)."
}
```

Or for empty code:
```json
{
  "status": "error",
  "message": "Invalid input",
  "detail": "Field 'code' is empty or missing."
}
```

#### 3. Execution Timeout (`HTTP 500 Internal Server Error`)
Occurs if compilation exceeds the configured timeout threshold.

```json
{
  "status": "error",
  "message": "Compilation timed out",
  "detail": "Compilation request exceeded execution timeout limit (5 seconds)."
}
```

#### 4. Generic Server Error (`HTTP 500 Internal Server Error`)
Occurs if the build environment encounters an internal file system or subprocess failure.

```json
{
  "status": "error",
  "message": "Internal server error",
  "detail": "<error_message>"
}
```

---

## 4. Compiler Pipeline & Hardware Configuration

### Standard Regular Arduino Code Support
The API compiles standard, clean Arduino C / C++ code with standard `void setup()` and `void loop()` entry points. No artificial wrappers or function injections are applied. Sketches compile directly as written.

### USB Device Name Descriptor: `"idan's DevBoard"`
The compiler automatically configures and enforces the USB Product String descriptor on the CH552 CDC firmware:
```c
__code uint16_t ProductDescriptor[] = {
    // Product String Descriptor: "idan's DevBoard"
    (((15 + 1) * 2) | (DTYPE_String << 8)),
    'i', 'd', 'a', 'n', '\'', 's', ' ',
    'D', 'e', 'v', 'B', 'o', 'a', 'r', 'd',
};
```
When the generated binary is flashed to the CH552 hardware, the device enumerates over USB as **`idan's DevBoard`** across all operating systems (Windows Device Manager, macOS, Linux `lsusb`) and web flasher interfaces (WebHID / Android).

### Target Board Configuration (FQBN)

The compiler compiles code for the **CH552** using the following Fully Qualified Board Name:

```text
CH55xDuino:mcs51:ch552:clock=24internal,usb_settings=usbcdc
```

- **Architecture:** MCS-51 (8051 compatible)
- **Clock:** 24 MHz internal oscillator (`clock=24internal`)
- **USB Settings:** USB CDC Serial (`usb_settings=usbcdc`) with 1200-baud automatic reset into bootloader mode.

### Sandboxing & Resource Isolation

Every compilation request undergoes a safe lifecycle:
1. Generates an isolated temporary directory using a random UUID:
   `/tmp/<UUID>/` (Linux) or `%TEMP%\<UUID>\` (Windows).
2. Creates `/tmp/<UUID>/sketch/sketch.ino` and writes the sanitized source code.
3. Invokes `arduino-cli compile --output-dir /tmp/<UUID>/out ...`.
4. Reads the generated output binary (`.bin`, `.hex`, or `.cmd`).
5. **Guaranteed Cleanup:** A `finally:` block cleans up `/tmp/<UUID>/` using `shutil.rmtree()`, ensuring no artifacts or disk leakage persist even on timeouts or exceptions.

---

## 5. Code Examples by Language & Environment

### 1. Browser / Frontend JavaScript (Vanilla Fetch & Blob)

This is the standard integration pattern used by web applications (e.g. `Editor/index.html`):

```javascript
/**
 * Compiles Arduino C/C++ code and triggers a browser file download of firmware.bin or firmware.hex
 * @param {string} sourceCode 
 * @param {'bin'|'hex'} format Output format ('bin' or 'hex')
 * @param {string} apiUrl 
 */
async function compileAndDownload(sourceCode, format = 'bin', apiUrl = 'https://web-compiler-api.onrender.com') {
  try {
    const response = await fetch(`${apiUrl}/compile?format=${format}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ code: sourceCode, format: format })
    });

    if (response.ok) {
      // 200 OK: Process downloaded file (blob)
      const blob = await response.blob();
      const downloadUrl = window.URL.createObjectURL(blob);
      const link = document.createElement('a');
      link.href = downloadUrl;
      link.download = `firmware.${format}`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      window.URL.revokeObjectURL(downloadUrl);
      console.log(`Firmware (${format.toUpperCase()}) compiled and downloaded successfully.`);
    } else {
      // Error: Parse JSON response
      const err = await response.json();
      console.error(`Compilation error (${response.status}):`, err.errors || err.detail || err.message);
      alert(`Compilation failed:\n${err.errors || err.message}`);
    }
  } catch (networkError) {
    console.error('Network or server unreachable:', networkError);
    alert(`Could not connect to compiler API: ${networkError.message}`);
  }
}

// Example usage
const sketch = `
void setup() {
  pinMode(33, OUTPUT);
}
void loop() {
  digitalWrite(33, HIGH);
  delay(250);
  digitalWrite(33, LOW);
  delay(250);
}
`;

compileAndDownload(sketch);
```

---

### 2. Browser / WebHID In-Memory Flashing Integration

If your frontend integrates with `HIDUploader` (`ch55x-hid-flasher.js`), you do not need to save the binary to disk. Pass the compiled binary buffer directly to the WebHID flasher:

```javascript
import { Ch55xHidFlasher } from './ch55x-hid-flasher.js';

async function compileAndFlashDirectly(sourceCode) {
  const response = await fetch('https://web-compiler-api.onrender.com/compile', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ code: sourceCode })
  });

  if (!response.ok) {
    const err = await response.json();
    throw new Error(err.errors || err.message);
  }

  // Get raw ArrayBuffer from response
  const arrayBuffer = await response.arrayBuffer();
  const binaryBytes = new Uint8Array(arrayBuffer);

  console.log(`Received binary: ${binaryBytes.length} bytes. Initiating WebHID flash...`);

  // Connect to CH552 HID Bootloader and flash directly
  const flasher = new Ch55xHidFlasher();
  await flasher.connect();
  await flasher.flash(binaryBytes, (progress) => {
    console.log(`Flashing progress: ${Math.round(progress * 100)}%`);
  });
  console.log('CH552 successfully flashed in-memory!');
}
```

---

### 3. Node.js (TypeScript / ES Module)

```typescript
import fs from 'node:fs/promises';

interface CompileErrorResponse {
  status: string;
  message: string;
  errors?: string;
  detail?: string;
}

async function compileCodeToFile(code: string, outputPath: string): Promise<void> {
  const endpoint = 'https://web-compiler-api.onrender.com/compile';

  const response = await fetch(endpoint, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ code })
  });

  if (!response.ok) {
    const errorJson = (await response.json()) as CompileErrorResponse;
    throw new Error(
      `Compilation failed [HTTP ${response.status}]:\n${errorJson.errors || errorJson.detail || errorJson.message}`
    );
  }

  const arrayBuffer = await response.arrayBuffer();
  const buffer = Buffer.from(arrayBuffer);
  await fs.writeFile(outputPath, buffer);

  console.log(`✓ Firmware written to: ${outputPath} (${buffer.length} bytes)`);
}

// Example Execution
const code = `
void setup() {
  Serial.begin(115200);
}
void loop() {
  Serial.println("Hello from Devbox CH552!");
  delay(1000);
}
`;

compileCodeToFile(code, './firmware.bin')
  .catch(console.error);
```

---

### 4. Python (`requests` & `httpx`)

#### Synchronous with `requests`
```python
import requests

API_URL = "https://web-compiler-api.onrender.com/compile"

source_code = """
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

response = requests.post(
    API_URL,
    json={"code": source_code},
    timeout=15.0
)

if response.status_code == 200:
    with open("firmware.bin", "wb") as f:
        f.write(response.content)
    print(f"Compilation succeeded! Saved firmware.bin ({len(response.content)} bytes).")
else:
    err = response.json()
    print(f"Compilation failed with status {response.status_code}:")
    print(err.get("errors") or err.get("detail") or err.get("message"))
```

#### Asynchronous with `httpx`
```python
import asyncio
import httpx

async def compile_ch552(code: str, output_file: str):
    url = "https://web-compiler-api.onrender.com/compile"
    async with httpx.AsyncClient(timeout=30.0) as client:
        res = await client.post(url, json={"code": code})
        
        if res.status_code == 200:
            with open(output_file, "wb") as f:
                f.write(res.content)
            print(f"Saved: {output_file}")
        else:
            print("Error:", res.json())

# asyncio.run(compile_ch552("void setup() {} void loop() {}", "out.bin"))
```

---

### 5. cURL / Command Line

#### Standard JSON Request
```bash
curl -X POST https://web-compiler-api.onrender.com/compile \
  -H "Content-Type: application/json" \
  -d '{"code":"void setup(){pinMode(33,OUTPUT);}void loop(){digitalWrite(33,HIGH);delay(500);digitalWrite(33,LOW);delay(500);}"}' \
  --output firmware.bin
```

#### Compiling an Existing `.ino` or `.c` File via `jq`
```bash
# Using jq to properly escape source file content into JSON:
jq -Rs '{"code": .}' sketch.ino | \
curl -X POST https://web-compiler-api.onrender.com/compile \
  -H "Content-Type: application/json" \
  -d @- \
  --output firmware.bin
```

#### Testing the Health Check
```bash
curl https://web-compiler-api.onrender.com/health
```

---

### 6. Android / Kotlin (`OkHttp`)

For mobile apps integrating the compilation flow (such as `HIDUploader/android`):

```kotlin
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject
import java.io.File
import java.util.concurrent.TimeUnit

class CompilerApiClient {
    private val client = OkHttpClient.Builder()
        .connectTimeout(15, TimeUnit.SECONDS)
        .readTimeout(30, TimeUnit.SECONDS)
        .build()

    fun compileCode(code: String, outputFile: File): Result<File> {
        val jsonPayload = JSONObject().apply {
            put("code", code)
        }.toString()

        val requestBody = jsonPayload.toRequestBody("application/json; charset=utf-8".toMediaType())
        val request = Request.Builder()
            .url("https://web-compiler-api.onrender.com/compile")
            .post(requestBody)
            .build()

        return try {
            val response = client.newCall(request).execute()
            if (response.isSuccessful && response.body != null) {
                val bytes = response.body!!.bytes()
                outputFile.writeBytes(bytes)
                Result.success(outputFile)
            } else {
                val errorBody = response.body?.string() ?: "Unknown error"
                val errorJson = JSONObject(errorBody)
                val errorMessage = errorJson.optString("errors", errorJson.optString("message", "Compilation failed"))
                Result.failure(Exception(errorMessage))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}
```

---

## 6. DevboxV1 End-to-End Workflow

The Compilation API sits right in the middle of the DevboxV1 pipeline:

```
1. Blockly Editor (Editor/index.html)
   └─ User connects visual blocks.
   └─ Generates clean Arduino C code with standard setup() and loop().

2. Compilation Service (API/app)
   └─ Frontend posts code to http://localhost:8000/compile or Render.
   └─ Compiles standard code, configures USB descriptor as "idan's DevBoard", produces firmware.bin.

3. Flashing (HIDUploader)
   └─ WebHID Flasher (Browser) or Android App connects to CH552 USB HID Bootloader.
   └─ Sends firmware.bin blocks directly to CH552 Internal Flash (0x0000).

4. Runtime Execution
   └─ Chip reboots into User App.
   └─ Identifies to the computer as "idan's DevBoard" with active USB CDC serial.
   └─ Executes standard setup() and loop().
```

---

## 7. Environment Variables & Configuration

The microservice can be configured at launch using the following environment variables:

| Variable | Default Value | Description |
| :--- | :--- | :--- |
| `ARDUINO_CLI_PATH` | `arduino-cli` | Path or command to the `arduino-cli` executable. |
| `CH552_FQBN` | `CH55xDuino:mcs51:ch552:clock=24internal,usb_settings=usbcdc` | Fully qualified board name specifying core, chip, oscillator, and USB class. |
| `COMPILATION_TIMEOUT_SECONDS` | `5.0` (Container) / `60.0` (Python) | Maximum duration allowed for `arduino-cli` compilation before raising `TimeoutException`. |
| `TMPDIR` | System default (`/tmp` on Linux, `%TEMP%` on Windows) | Base directory for isolated build workspaces. |

---

## 8. Local Development & Self-Hosting

### Prerequisites
- **Python 3.11+** installed
- **`arduino-cli`** installed and available in PATH
- **CH55xDuino** core installed:
  ```bash
  arduino-cli config init
  arduino-cli config add board_manager.additional_urls https://raw.githubusercontent.com/DeqingSun/ch55xduino/refs/heads/ch55xduino/package_ch55xduino_mcs51_index.json
  arduino-cli core update-index
  arduino-cli core install CH55xDuino:mcs51
  ```

### Running with Uvicorn

```bash
# 1. Navigate to API directory
cd API

# 2. Activate virtual environment (if present)
.\.venv\Scripts\Activate.ps1    # Windows PowerShell
# source .venv/bin/activate     # Linux / macOS

# 3. Install requirements
pip install -r requirements.txt

# 4. Start development server
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

The API will be available at: `http://localhost:8000`

### Running with Docker

The provided `Dockerfile` automates the entire installation of `arduino-cli`, the `CH55xDuino` core, Python 3.11, and dependencies in an isolated container:

```bash
# 1. Build Docker image
docker build -t ch552-compiler-api ./API

# 2. Run container on port 8000
docker run -d -p 8000:8000 --name ch552-compiler ch552-compiler-api

# 3. Test container health
curl http://localhost:8000/health
```

### Executing Unit Tests

Unit tests are written using `pytest` and `fastapi.testclient`:

```bash
cd API
pytest
```

Tests verify:
- Health check endpoint (`/health`)
- Mocked successful compilation returning raw bytes (`.bin`)
- Proper translation of compiler errors to `HTTP 400`
- Input validation (empty code, code exceeding 64 KB)
- Subprocess timeout handling (`HTTP 500`)
- Cleanup of temporary directories even when compilation fails.

---

## 9. Troubleshooting & FAQ

### Q: Why did I receive `HTTP 400 Bad Request`?
**A:** Your C/Arduino code failed to compile. Inspect the `errors` property in the returned JSON. It contains the exact GCC/SDCC error output with line numbers and character positions.

### Q: Why did I receive `HTTP 422 Unprocessable Entity`?
**A:** This indicates an input validation issue:
- Your request payload did not include the `code` field.
- The `code` string was empty or contained only whitespace.
- The code length exceeded the 64 KB (65,536 bytes) limit.

### Q: Why does the first request take 40 seconds on Render?
**A:** On free cloud hosting tiers, unused containers go to sleep. When a new request arrives, the hosting provider boots the container and pulls the image (cold start). Subsequent requests will respond in 1–2 seconds.

### Q: Does the service support other microcontrollers (like ESP32 or ATmega328P)?
**A:** By default, the service is optimized specifically for the WCH CH552 using the `CH55xDuino:mcs51` package. However, you can change the target board by setting the `CH552_FQBN` environment variable to any board supported by `arduino-cli`.

### Q: Can my web app send raw text instead of JSON?
**A:** Yes. `POST /compile` accepts both `application/json` and `text/plain`. If sending `text/plain`, you can send the raw Arduino code directly in the HTTP request body.
