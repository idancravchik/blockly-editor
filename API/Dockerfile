FROM python:3.11-slim

# Install system utilities required for arduino-cli installation and execution
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Download and install arduino-cli to /usr/local/bin
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/local/bin sh

# Configure arduino-cli and pre-install CH55xDuino core package at build time
RUN arduino-cli config init && \
    arduino-cli core update-index --additional-urls https://raw.githubusercontent.com/DeqingSun/ch55xduino/refs/heads/ch55xduino/package_ch55xduino_mcs51_index.json && \
    arduino-cli core install CH55xDuino:mcs51 --additional-urls https://raw.githubusercontent.com/DeqingSun/ch55xduino/refs/heads/ch55xduino/package_ch55xduino_mcs51_index.json && \
    python3 -c '\
import glob, re; \
pattern = r"__code\s+uint16_t\s+ProductDescriptor\[\]\s*=\s*\{[^}]+\};"; \
replacement = """__code uint16_t ProductDescriptor[] = {\\n    (((15 + 1) * 2) | (DTYPE_String << 8)),\\n    \x27i\x27, \x27d\x27, \x27a\x27, \x27n\x27, \x27\\\x27\x27, \x27s\x27, \x27 \x27, \x27D\x27, \x27e\x27, \x27v\x27, \x27B\x27, \x27o\x27, \x27a\x27, \x27r\x27, \x27d\x27\\n};"""; \
for f in glob.glob("/root/.arduino15/packages/CH55xDuino/hardware/mcs51/*/cores/ch55xduino/USBconstant.c"): \
    c = open(f).read(); \
    open(f, "w").write(re.sub(pattern, replacement, c)); \
    print("Patched USB descriptor in", f)'
# Set working directory
WORKDIR /workspace

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application package
COPY app ./app

# Expose port
EXPOSE 8000

# Set default runtime environment variables
ENV PYTHONUNBUFFERED=1
ENV ARDUINO_CLI_PATH=/usr/local/bin/arduino-cli
ENV COMPILATION_TIMEOUT_SECONDS=5.0

# Start Uvicorn server
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
