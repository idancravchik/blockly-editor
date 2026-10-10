#include <Serial.h>

void setup() {
  Serial0_begin(115200);
}

void loop() {
  USBSerial_println("B");
  Serial0_println("B");
  delay(1000);
}
