#include <Serial.h>

#define BOOTLOADER_MAGIC_BYTE 0xFE

void jump_to_bootloader(void) {
  // 1. Disable all interrupts
  EA = 0;

  // 2. Shut down USB peripheral to force host disconnection
  USB_CTRL = 0;
  UDEV_CTRL = 0;

  // 3. Short delay (~50ms) to allow host to detect disconnect
  for (uint16_t i = 0; i < 50000; i++) {
    __asm nop __endasm;
  }

  // 4. Jump directly to high HID Bootloader entry point (0x2C00)
  __asm
    ljmp 0x2C00
  __endasm;
}

void check_bootloader_trigger(void) {
  while (USBSerial_available()) {
    if (USBSerial_read() == BOOTLOADER_MAGIC_BYTE) {
      jump_to_bootloader();
    }
  }
}

void setup() {
  Serial0_begin(115200);
}

void loop() {
  check_bootloader_trigger();

  USBSerial_println("B");
  Serial0_println("B");

  // Responsive delay: check for magic byte every 50ms instead of blocking for 1000ms
  for (uint8_t i = 0; i < 20; i++) {
    check_bootloader_trigger();
    delay(50);
  }
}
