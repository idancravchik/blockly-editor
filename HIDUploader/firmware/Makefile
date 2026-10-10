# Makefile for CH552 USB HID Bootloader
CC = sdcc
PACKIHX = packihx

TARGET = ch552_hid_bootloader
SRC_DIR = src
BUILD_DIR = build

# Memory Layout:
# High Bootloader at 0x2C00 (3 KB), User Application at 0x0000 (11 KB)
# Internal RAM: small model, XRAM: up to 1024 bytes (0x0400)
CFLAGS = -mmcs51 --model-small \
         --code-loc 0x2C00 --code-size 0x0C00 \
         --xram-loc 0x0000 --xram-size 0x0400 \
         --opt-code-size -I$(SRC_DIR)

all: $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin

$(BUILD_DIR)/$(TARGET).hex: $(SRC_DIR)/bootloader.c | $(BUILD_DIR)
	cd $(SRC_DIR) && $(CC) $(CFLAGS) bootloader.c -o ../$(BUILD_DIR)/$(TARGET).ihx
	$(PACKIHX) $(BUILD_DIR)/$(TARGET).ihx > $@
	@echo "HEX Build complete: $@"

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).hex
	python scripts/generate_bin.py
	@echo "BIN Build complete: $@"

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)/* $(SRC_DIR)/*.rel $(SRC_DIR)/*.asm $(SRC_DIR)/*.lst $(SRC_DIR)/*.map $(SRC_DIR)/*.mem $(SRC_DIR)/*.sym $(SRC_DIR)/*.rst

.PHONY: all clean
