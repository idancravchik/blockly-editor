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
    arduino-cli core install CH55xDuino:mcs51 --additional-urls https://raw.githubusercontent.com/DeqingSun/ch55xduino/refs/heads/ch55xduino/package_ch55xduino_mcs51_index.json
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
