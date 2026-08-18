# CH552 Build Microservice

Stateless API microservice that receives C / Arduino C++ source code, compiles it targeting the **CH552** (including CH552G) microcontroller via `arduino-cli` with `CH55xDuino` core, and returns the raw compiled binary (`.bin`) file ready for flashing.

Includes built-in support for USB CDC and automatic 1200-baud reset (`CH55xDuino:mcs51:ch552:clock=24internal,usb_settings=usbcdc`).

---

## 🌐 Public Deployment

**Live API URL:** https://web-compiler-api.onrender.com

---

## 📡 API Endpoints

### 1. **Health Check**
```http
GET /health
```

**Response (200 OK):**
```json
{
  "status": "ok",
  "service": "CH552 Build Microservice"
}
```

---

### 2. **Compile Code** (Main Endpoint)
```http
POST /compile
Content-Type: application/json
```

#### Request Payload
```json
{
  "code": "void setup() {\n  pinMode(33, OUTPUT);\n}\n\nvoid loop() {\n  digitalWrite(33, HIGH);\n  delay(500);\n  digitalWrite(33, LOW);\n  delay(500);\n}"
}
```

#### Success Response (`HTTP 200 OK`)
* **Content-Type:** `application/octet-stream`
* **Body:** Raw binary bytes of `.bin` file (download directly as attachment)

#### Compilation Error Response (`HTTP 400 Bad Request`)
* **Content-Type:** `application/json`
* **Body:**
```json
{
  "status": "error",
  "message": "Compilation failed",
  "errors": "sketch.ino: In function 'void loop()':\nsketch.ino:6:3: error: 'degitalWrite' was not declared..."
}
```

#### Validation Error Response (`HTTP 422 Unprocessable Entity`)
* **Content-Type:** `application/json`
* **Body:**
```json
{
  "status": "error",
  "message": "Invalid input",
  "detail": "body -> code: Field 'code' exceeds maximum allowed size of 65536 bytes (64KB)."
}
```

#### Timeout / Internal Error (`HTTP 500 Internal Server Error`)
* **Content-Type:** `application/json`
* **Body:**
```json
{
  "status": "error",
  "message": "Compilation request exceeded execution timeout limit (5 seconds)."
}
```

---

## 💻 Code Examples

### JavaScript/Fetch
```javascript
async function compileCode(arduinoCode) {
  const response = await fetch('https://web-compiler-api.onrender.com/compile', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ code: arduinoCode })
  });

  if (response.ok) {
    // Download binary
    const blob = await response.blob();
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'firmware.bin';
    a.click();
    window.URL.revokeObjectURL(url);
  } else {
    const error = await response.json();
    console.error('Compilation failed:', error.errors);
  }
}

// Usage
const code = `
void setup() {
  pinMode(33, OUTPUT);
}

void loop() {
  digitalWrite(33, HIGH);
  delay(500);
  digitalWrite(33, LOW);
  delay(500);
}
`;

compileCode(code);
```

### Python/Requests
```python
import requests

def compile_code(arduino_code):
    response = requests.post(
        'https://web-compiler-api.onrender.com/compile',
        json={'code': arduino_code}
    )
    
    if response.status_code == 200:
        with open('firmware.bin', 'wb') as f:
            f.write(response.content)
        print("✓ Compilation successful! Binary saved as firmware.bin")
    else:
        error = response.json()
        print(f"✗ Compilation error:\n{error['errors']}")

# Example usage
sample_code = """
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

compile_code(sample_code)
```

### cURL
```bash
curl -X POST https://web-compiler-api.onrender.com/compile \
  -H "Content-Type: application/json" \
  -d '{"code":"void setup(){pinMode(33,OUTPUT);}void loop(){digitalWrite(33,HIGH);delay(500);digitalWrite(33,LOW);delay(500);}"}' \
  --output firmware.bin
```

---

## ⚙️ Constraints & Specifications

| Constraint | Value |
|-----------|-------|
| Max code size | 64 KB |
| Compilation timeout | 5 seconds |
| Target microcontroller | CH552/CH552G |
| Core frequency | 24 MHz (internal oscillator) |
| USB support | CDC (USB serial) |
| Bootloader mode trigger | 1200 baud reset (automatic) |

---

## 🚀 Local Development

### Prerequisites
* Python 3.11+
* `arduino-cli` installed and in PATH
* `CH55xDuino:mcs51` core installed in arduino-cli

### Installation & Setup

#### 1. Install Python Dependencies
```bash
cd API
pip install -r requirements.txt
```

#### 2. Set up arduino-cli (if not already done)
```bash
# Install arduino-cli from https://arduino.github.io/arduino-cli/latest/installation/

# Add CH55xDuino core
arduino-cli config init
arduino-cli core install CH55xDuino:mcs51

# Verify installation
arduino-cli core list
```

#### 3. Run Development Server
```bash
cd API
uvicorn app.main:app --reload --port 8000
```

Server will start at `http://localhost:8000`

#### 4. View API Documentation
* **Swagger UI:** http://localhost:8000/docs
* **ReDoc:** http://localhost:8000/redoc

---

## 🧪 Testing

### Run Unit Tests
```bash
cd API
pytest
```

### Test Against Live API
```bash
# Test health check
curl https://web-compiler-api.onrender.com/health

# Test compilation
curl -X POST https://web-compiler-api.onrender.com/compile \
  -H "Content-Type: application/json" \
  -d '{"code":"void setup(){} void loop(){}"}' \
  --output test_firmware.bin
```

---

## 🐳 Docker Deployment

### Build Container Image
```bash
docker build -t ch552-builder ./API
```

### Run Locally
```bash
docker run -d -p 8000:8000 --name ch552-service ch552-builder
```

Test the containerized service:
```bash
curl http://localhost:8000/health
```

### Environment Variables
```bash
# Optional: Override defaults when running container
docker run -d -p 8000:8000 \
  -e ARDUINO_CLI_PATH=/usr/bin/arduino-cli \
  -e CH552_FQBN="CH55xDuino:mcs51:ch552:clock=24internal,usb_settings=usbcdc" \
  -e COMPILATION_TIMEOUT_SECONDS=5.0 \
  --name ch552-service ch552-builder
```

---

## 📦 Project Structure

```
API/
├── app/
│   ├── __init__.py
│   ├── main.py           # FastAPI app & endpoints
│   ├── compiler.py       # Compilation logic
│   └── schemas.py        # Pydantic request/response models
├── tests/
│   ├── __init__.py
│   └── test_compile.py   # Unit tests
├── Dockerfile            # Container configuration
├── requirements.txt      # Python dependencies
└── README.md            # This file
```

---

## 🔧 Configuration

All configuration is handled through environment variables:

| Variable | Default | Description |
|----------|---------|-------------|
| `ARDUINO_CLI_PATH` | `arduino-cli` | Path to arduino-cli executable |
| `CH552_FQBN` | `CH55xDuino:mcs51:ch552:clock=24internal,usb_settings=usbcdc` | Fully qualified board name |
| `COMPILATION_TIMEOUT_SECONDS` | `5.0` | Max compilation time (seconds) |
| `TMPDIR` | System default | Temporary directory for build artifacts |
