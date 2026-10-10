#include <Serial.h>

void setup() {
  Serial0_begin(115200);
}

void loop() {
  USBSerial_println("A");
  Serial0_println("A");
  delay(1000);
}
