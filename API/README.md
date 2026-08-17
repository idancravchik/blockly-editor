# CH552 Build Microservice

Stateless API microservice that receives C / Arduino C++ source code, compiles it targeting the **CH552** (including CH552G) microcontroller via `arduino-cli` with `CH55xDuino` core, and returns the raw compiled binary (`.bin`) file ready for flashing.

Includes built-in support for USB CDC and automatic 1200-baud reset (`CH55xDuino:mcs51:ch552:clock=24,usbsettings=defaultcdc`).

---

## API Endpoints

### `POST /compile`

#### Request Payload (`application/json`)
```json
{
  "code": "void setup() {\n  pinMode(33, OUTPUT);\n}\nvoid loop() {\n  digitalWrite(33, HIGH);\n  delay(500);\n  digitalWrite(33, LOW);\n  delay(500);\n}"
}
```

#### Success Response (`HTTP 200 OK`)
* **Headers:**
  * `Content-Type: application/octet-stream`
  * `Content-Disposition: attachment; filename="firmware.bin"`
* **Body:** Raw binary bytes of `.bin` file.

#### Compilation Error Response (`HTTP 400 Bad Request`)
* **Headers:** `Content-Type: application/json`
* **Body:**
```json
{
  "status": "error",
  "message": "Compilation failed",
  "errors": "sketch.ino: In function 'void loop()':\nsketch.ino:6:3: error: 'degitalWrite' was not declared..."
}
```

#### Validation Error Response (`HTTP 422 Unprocessable Entity`)
* **Headers:** `Content-Type: application/json`
* **Body:**
```json
{
  "status": "error",
  "message": "Invalid input",
  "detail": "body -> code: Field 'code' exceeds maximum allowed size of 65536 bytes (64KB)."
}
```

#### Timeout / Internal Error (`HTTP 500 Internal Server Error`)
* **Headers:** `Content-Type: application/json`

---

## Running Locally

### 1. Requirements
* Python 3.11+
* `arduino-cli` (with `CH55xDuino:mcs51` core installed if compiling real code locally)

### 2. Install Dependencies
```bash
cd API
pip install -r requirements.txt
```

### 3. Run Development Server
```bash
uvicorn app.main:app --reload --port 8000
```

---

## Running Automated Tests

Run pytest inside the `API` directory:
```bash
cd API
pytest
```

---

## Docker Deployment

### 1. Build Container Image
```bash
docker build -t ch552-builder ./API
```

### 2. Run Container
```bash
docker run -d -p 8000:8000 --name ch552-service ch552-builder
```
