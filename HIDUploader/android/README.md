# Integrating CH55x HID Flasher into an Android Project (Java)

This guide walks you through integrating the **CH552 USB HID Flasher** library into any Android application written in **Java**. 

---

## 📋 Table of Contents
1. [Overview](#1-overview)
2. [Step 1: Adding the Library to Your Project](#2-step-1-adding-the-library-to-your-project)
3. [Step 2: Android Manifest Configuration](#3-step-2-android-manifest-configuration)
4. [Step 3: Writing C Code for CH552 (Architecture, Features & Examples)](#4-step-3-writing-c-code-for-ch552-architecture-features--examples)
5. [Step 4: Preparing Your Firmware (.hex File)](#5-step-4-preparing-your-firmware-hex-file)
6. [Step 5: Complete Implementation Example](#6-step-5-complete-implementation-example)
7. [Step 6: Understanding the API & Workflow](#7-step-6-understanding-the-api--workflow)
8. [Step 7: Best Practices & Common Pitfalls](#8-step-7-best-practices--common-pitfalls)

---

## 1. Overview

The `ch55x-hid-flasher` library communicates directly with the CH552 microcontroller using Android's native **USB Host API (`android.hardware.usb`)**.

### Why is this easy to work with?
* **Zero custom drivers needed**: The bootloader runs as a standard **USB HID** device (the same class used by keyboards and mice), which Android supports natively on all versions.
* **Pure Java**: No NDK, no C++ JNI bindings, and no Kotlin dependencies.
* **Asynchronous**: Flashing runs in a background thread so the app UI never freezes.

---

## 2. Step 1: Adding the Library to Your Project

You have two simple options. Choose whichever fits your project best:

### Option A: Direct File Copy (Recommended - 1 minute)
The fastest and cleanest method is to copy the 3 Java source files directly into your app source tree:

1. Copy the Java files from `android/ch55x-hid-flasher/src/main/java/com/devbox/ch55x/`:
   * `Ch55xHidFlasher.java` — The main USB HID flashing engine.
   * `Ch55xCompiler.java` — On-device C code compiler engine.
   * `CompilerCallback.java` — Callback listener for compilation status and results.
   * `IntelHexParser.java` — Converts Intel `.hex` files into binary and computes the CRC16.
   * `FlasherCallback.java` — Interface for progress, status, success, and error events.
2. Paste them into your app project under:
   ```text
   app/src/main/java/com/devbox/ch55x/
   ```
   *(Or change the package name at the top of each file to match your project's package).*

---

### Option B: Include as a Gradle Module
If you prefer keeping the library as an isolated module:

1. Copy the `android/ch55x-hid-flasher` folder into your Android project root.
2. In your `settings.gradle` (or `settings.gradle.kts`), add:
   ```groovy
   // settings.gradle
   include ':ch55x-hid-flasher'
   ```
3. In your app module's `app/build.gradle` (or `app/build.gradle.kts`), add to dependencies:
   ```groovy
   // app/build.gradle
   dependencies {
       implementation project(':ch55x-hid-flasher')
   }
   ```
4. Click **Sync Project with Gradle Files**.

---

## 3. Step 2: Android Manifest Configuration

Open `app/src/main/AndroidManifest.xml` and add the USB Host feature.

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.yourcompany.yourapp">

    <!-- 1. Declare USB Host capability -->
    <uses-feature
        android:name="android.hardware.usb.host"
        android:required="true" />

    <application
        android:allowBackup="true"
        android:label="@string/app_name"
        android:theme="@style/Theme.AppCompat.Light.DarkActionBar">

        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

    </application>
</manifest>
```

> **Note:** If your app can function without USB (e.g., USB flashing is just one optional feature), set `android:required="false"`.

---

## 4. Step 3: Writing C Code for CH552 (Architecture, Features & Examples)

Before flashing from Android, you need to compile your C code into an Intel `.hex` file. The CH552 microcontroller is programmed using the **CH55xduino** Arduino-compatible plain-C core.

### 4.1 Development Setup (Arduino IDE)
1. Install Arduino IDE (v1.8.x or v2.x).
2. Go to **File -> Preferences -> Additional Boards Manager URLs**, and add:
   ```text
   https://raw.githubusercontent.com/DeqingSun/ch55xduino/ch55xduino/package_ch55xduino_mcs51_index.json
   ```
3. Go to **Tools -> Board -> Boards Manager**, search for `ch55x`, and install **CH55xduino**.
4. Select **Tools -> Board -> CH55x Boards -> CH552 Board**.
5. Keep default settings:
   * **Clock Source**: Internal 16MHz (or 24MHz)
   * **USB Settings**: Default CDC (gives you built-in USB Serial automatically!)

---

### 4.2 Language & Code Architecture: Plain C (SDCC)
Under the hood, CH55xduino uses the **SDCC (Small Device C Compiler)** for the MCS-51 (8051) architecture. 

* **Syntax Style**: Uses familiar Arduino `setup()` and `loop()` structure.
* **Plain C, No C++ Classes**: SDCC compiles standard C. You do NOT use C++ class notation like `Serial.println()`. Instead, CH55xduino provides C functions and C11 `_Generic` macros:
  * For USB Virtual COM Port: `USBSerial_println(...)`, `USBSerial_print(...)`, `USBSerial_read()`.
  * For Hardware UART0: `Serial0_println(...)`, `Serial0_begin(115200)`.

---

### 4.3 Hardware Rules, Limits & Constraints (Crucial!)

| Parameter | Specification | Notes & Guidelines |
| :--- | :--- | :--- |
| **Max User Code Flash** | **11 KB (11,264 bytes)** | Addresses `0x0000` to `0x2BFF`. The bootloader reserves `0x2C00` to `0x37FF`. The flasher will reject any `.hex` exceeding 11,264 bytes. |
| **Data RAM (IDATA)** | **256 Bytes** | Fast internal memory used for the call stack and local variables. Avoid deep recursive functions. |
| **External RAM (XRAM)** | **1024 Bytes** | Used for global variables, buffers, and USB endpoints. Keep array buffers under 256 bytes. |
| **Pin Numbering Rule** | `Port.Bit` $\rightarrow$ `PortBit` | Pins are named by two-digit integers: `P1.1` is **`11`**, `P1.5` is **`15`**, `P3.2` is **`32`**, `P3.4` is **`34`**. Aliases like `A0` or `LED_BUILTIN` do not exist. |
| **ADC Mode Requirement** | `pinMode(pin, INPUT)` | **Mandatory** before calling `analogRead()`! 8051 pins default to weak pull-up mode, which skews analog readings if not set to `INPUT`. |

---

### 4.4 Supported Hardware Functions & APIs

1. **Digital I/O**:
   * `pinMode(pin, OUTPUT)` — Push-pull output (10–20mA drive).
   * `pinMode(pin, INPUT)` — High-impedance floating input (required for ADC).
   * `pinMode(pin, INPUT_PULLUP)` — Input with internal ~100kΩ pull-up resistor.
   * `digitalWrite(pin, HIGH / LOW)` — Set pin voltage.
   * `digitalRead(pin)` — Read logic state (`HIGH` / `LOW`).

2. **Analog Input (ADC - 8-bit, 0 to 255)**:
   * Supported ADC Pins: Pin `11` (P1.1 / AIN0), Pin `14` (P1.4 / AIN1), Pin `15` (P1.5 / AIN2), Pin `32` (P3.2 / AIN3).
   * Function: `analogRead(pin)` (Returns `0` to `255`).

3. **PWM Output (Analog Write - 8-bit, 0 to 255)**:
   * Supported PWM Pins: Pin `15` (PWM1 default), Pin `30` (PWM1 alternate), Pin `34` (PWM2 default), Pin `31` (PWM2 alternate).
   * Function: `analogWrite(pin, dutyCycle)` (`0` = 0%, `255` = 100%).

4. **USB & Serial Communication**:
   * **USB CDC (Virtual COM Port)**: Active automatically with default settings! No `USBSerial_begin()` needed.
     * `USBSerial_println("Text")`
     * `USBSerial_print(number)`
     * `USBSerial_available()`
     * `USBSerial_read()`
   * **Hardware UART0**: Pin 30 (RX), Pin 31 (TX).
     * `Serial0_begin(115200)`
     * `Serial0_println("UART message")`

5. **Capacitive Touch Keys (Built-in Hardware)**:
   * Pins: `10` (TIN0), `11` (TIN1), `14` (TIN2), `15` (TIN3), `16` (TIN4), `17` (TIN5).
   * Functions: `#include <TouchKey.h>`, `TouchKey_begin(mask)`, `TouchKey_get(channel)`.

6. **Timing & Delays**:
   * `delay(milliseconds)`
   * `delayMicroseconds(microseconds)`
   * `millis()`

---

### 4.5 Concrete Code Examples

#### Example 1: USB Serial Telemetry (Sends data every 1 second)
```c
#include <Arduino.h>

void setup() {
    // USB CDC Virtual COM port is active by default at 12 Mbps full speed
}

void loop() {
    // Transmit telemetry over USB CDC Virtual COM port
    USBSerial_println("Idan's DevBoard: Online and working!");
    
    // Wait 1 second
    delay(1000);
}
```

#### Example 2: Digital Input & Output (Button with Pull-up and LED)
```c
#include <Arduino.h>

#define LED_PIN  34   // P3.4 (Output)
#define BTN_PIN  32   // P3.2 (Input with pull-up to GND)

void setup() {
    pinMode(LED_PIN, OUTPUT);
    pinMode(BTN_PIN, INPUT_PULLUP);
}

void loop() {
    // Button connected between Pin 32 and GND
    if (digitalRead(BTN_PIN) == LOW) {
        digitalWrite(LED_PIN, HIGH);
        USBSerial_println("Button Pressed!");
    } else {
        digitalWrite(LED_PIN, LOW);
    }
    
    delay(50); // Small debounce delay
}
```

#### Example 3: Analog Sensor Reading (Potentiometer / Light Sensor)
```c
#include <Arduino.h>

#define SENSOR_PIN 11  // P1.1 (AIN0)

void setup() {
    // MUST set to INPUT for accurate ADC reading
    pinMode(SENSOR_PIN, INPUT);
}

void loop() {
    // Read 8-bit analog value (0 to 255)
    uint8_t value = analogRead(SENSOR_PIN);
    
    USBSerial_print("Sensor raw reading: ");
    USBSerial_println(value);
    
    delay(200);
}
```

---

---

### 4.6 Writing Code with Pure SDCC (For On-Device Mobile Compilation)
If you are compiling directly inside your Android app (or without Arduino IDE), you write **Pure SDCC C code**:

* **Include Header**: `#include "ch552_sdcc.h"` (provided in `firmware/include/ch552_sdcc.h`).
* **Entry Point**: Standard `void main(void)` with an infinite `while(1)` loop (instead of `setup()`/`loop()`).
* **SDCC Keywords**:
  * `__sfr __at (0x90) P1;` — Declares a Special Function Register.
  * `__sbit __at (0x95) P1_5;` — Declares a bit-addressable pin.
  * `__code const char str[] = "...";` — Stores constant strings in Flash ROM (saves precious RAM!).
  * `__xdata uint8_t buffer[64];` — Allocates data in 1KB External RAM.

#### Complete Minimal Pure SDCC Example:
```c
#include "ch552_sdcc.h"

void main(void) {
    // 1. Configure Pin 34 (P3.4) as Push-Pull Output
    PIN_MODE_OUTPUT(3, 4);

    // 2. Main execution loop
    while (1) {
        P3_4 = 1;         // LED ON
        delay_ms(500);    // Wait 500ms
        P3_4 = 0;         // LED OFF
        delay_ms(500);    // Wait 500ms
    }
}
```

#### SDCC Compiler Command & Memory Flags:
To compile for CH552 with our bootloader:
```bash
sdcc -mmcs51 --model-small --xram-loc 0x0000 --xram-size 1024 --code-loc 0x0000 --code-size 11264 sketch.c -o firmware.ihx
```
* `-mmcs51`: Targets the 8051 core.
* `--model-small`: Uses internal IDATA for maximum speed and compact code.
* `--xram-loc 0x0000 --xram-size 1024`: Allocates up to 1KB of XRAM.
* `--code-loc 0x0000 --code-size 11264`: Caps code size to 11KB (0x2C00) so it never touches the bootloader.
* Output `.ihx` is already 100% standard Intel HEX and ready to be flashed directly!

---

### 4.7 How to Export the Intel `.hex` File (Desktop Arduino IDE)
If compiling on PC:
1. In Arduino IDE, click **Sketch -> Export Compiled Binary** (or press `Ctrl + Alt + S`).
2. Go to your sketch folder (click **Sketch -> Show Sketch Folder**).
3. You will see a file named `<YourSketchName>.ino.hex`.
4. This `.hex` file is your compiled firmware, ready to be copied into Android!

---

## 5. Step 4: Preparing Your Firmware (.hex File)

You need to feed an Intel HEX string to the `flash()` method. Here are the two standard ways:

### Method 1: Read from `assets/` folder (Recommended for sketches)
1. Place your compiled `.hex` file (e.g. `firmware.hex`) in:
   ```text
   app/src/main/assets/firmware.hex
   ```
2. Read it in Java using this helper method:
   ```java
   private String readAssetFile(String fileName) throws IOException {
       try (InputStream is = getAssets().open(fileName);
            BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {
           StringBuilder sb = new StringBuilder();
           String line;
           while ((line = reader.readLine()) != null) {
               sb.append(line).append("\n");
           }
           return sb.toString();
       }
   }
   ```

### Method 2: Hardcode as a Java String Constant
For small firmwares or quick tests, store it directly in a Java file:
```java
public class FirmwarePresets {
    public static final String MY_HEX =
        ":10000000020008000000000012001575B000120038\n" +
        ":100015007590001200380200157580007581072230\n" +
        ":00000001FF";
}
```

### Method 3: Compile C Code Directly on the Phone (`Ch55xCompiler`)
If the user enters C code directly in your Android app, use the bundled `Ch55xCompiler`:

```java
Ch55xCompiler compiler = new Ch55xCompiler(this);

String myCode = 
    "#include \"ch552_sdcc.h\"\n" +
    "void main(void) {\n" +
    "    PIN_MODE_OUTPUT(3, 4);\n" +
    "    while(1) { P3_4 = !P3_4; delay_ms(250); }\n" +
    "}";

// Compile C code on-device into Intel HEX
compiler.compile(myCode, new CompilerCallback() {
    @Override
    public void onStatus(String message) {
        // e.g. "Running on-device SDCC compiler..."
    }

    @Override
    public void onSuccess(String hexContent, String compileLog) {
        // Received Intel HEX string! You can now pass it directly to flasher.flash(...)
        flasher.flash(device, hexContent, flasherCallback);
    }

    @Override
    public void onError(String errorMessage) {
        // Syntax or link error (displays exact line number and compiler error)
        Toast.makeText(context, "Compiler Error: " + errorMessage, Toast.LENGTH_LONG).show();
    }
});
```

*(You can also use `compiler.compileAndFlash(flasher, device, myCode, unifiedCallback)` to perform compilation and flashing in a single seamless call!)*

---

## 6. Step 5: Complete Implementation Example

Here is a complete, working `MainActivity.java` with a clean UI layout.

### XML Layout (`activity_main.xml`)
```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:gravity="center"
    android:padding="24dp">

    <TextView
        android:id="@+id/statusText"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Connect CH552 board via USB OTG"
        android:textSize="16sp"
        android:layout_marginBottom="24dp" />

    <ProgressBar
        android:id="@+id/progressBar"
        style="?android:attr/progressBarStyleHorizontal"
        android:layout_width="match_parent"
        android:layout_height="16dp"
        android:max="100"
        android:progress="0"
        android:layout_marginBottom="24dp" />

    <Button
        android:id="@+id/btnFlash"
        android:layout_width="match_parent"
        android:layout_height="60dp"
        android:text="Flash Firmware" />

</LinearLayout>
```

### Java Code (`MainActivity.java`)
```java
package com.yourcompany.yourapp;

import android.hardware.usb.UsbDevice;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.devbox.ch55x.Ch55xHidFlasher;
import com.devbox.ch55x.FlasherCallback;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class MainActivity extends AppCompatActivity {

    private Ch55xHidFlasher flasher;
    private Button btnFlash;
    private ProgressBar progressBar;
    private TextView statusText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // 1. Initialize the flasher engine with the Activity Context
        flasher = new Ch55xHidFlasher(this);

        btnFlash = findViewById(R.id.btnFlash);
        progressBar = findViewById(R.id.progressBar);
        statusText = findViewById(R.id.statusText);

        btnFlash.setOnClickListener(v -> startFlashingProcess());
    }

    private void startFlashingProcess() {
        // 2. Discover the connected CH552 device (VID 0x1209, PID 0xC55D)
        UsbDevice device = flasher.findConnectedDevice();

        if (device == null) {
            Toast.makeText(this, "CH552 board not detected! Connect via USB OTG.", Toast.LENGTH_SHORT).show();
            statusText.setText("Status: No device detected.");
            return;
        }

        statusText.setText("Status: Device found! Checking permissions...");

        // 3. Request USB permission from the user
        flasher.requestPermission(device, granted -> {
            if (granted) {
                // Permission granted by user -> load HEX and flash
                loadAndFlash(device);
            } else {
                Toast.makeText(this, "USB permission was denied.", Toast.LENGTH_SHORT).show();
                statusText.setText("Status: Permission denied.");
            }
        });
    }

    private void loadAndFlash(UsbDevice device) {
        String hexContent;
        try {
            // Read firmware from assets/firmware.hex
            hexContent = readAssetFile("firmware.hex");
        } catch (IOException e) {
            Toast.makeText(this, "Failed to load firmware.hex from assets: " + e.getMessage(), Toast.LENGTH_LONG).show();
            return;
        }

        // Disable button and reset progress
        btnFlash.setEnabled(false);
        progressBar.setProgress(0);

        // 4. Execute flashing asynchronously
        flasher.flash(device, hexContent, new FlasherCallback() {

            @Override
            public void onProgress(int percent, int currentBytes, int totalBytes) {
                // IMPORTANT: Callbacks arrive on a background thread!
                // Always wrap UI updates in runOnUiThread().
                runOnUiThread(() -> {
                    progressBar.setProgress(percent);
                    statusText.setText("Flashing: " + percent + "% (" + currentBytes + "/" + totalBytes + " B)");
                });
            }

            @Override
            public void onStatus(String message) {
                runOnUiThread(() -> statusText.setText("Status: " + message));
            }

            @Override
            public void onSuccess() {
                runOnUiThread(() -> {
                    btnFlash.setEnabled(true);
                    progressBar.setProgress(100);
                    statusText.setText("Status: Success! Microcontroller reprogrammed.");
                    Toast.makeText(MainActivity.this, "Flash Complete!", Toast.LENGTH_LONG).show();
                });
            }

            @Override
            public void onError(Throwable error) {
                runOnUiThread(() -> {
                    btnFlash.setEnabled(true);
                    statusText.setText("Error: " + error.getMessage());
                    Toast.makeText(MainActivity.this, "Flash failed: " + error.getMessage(), Toast.LENGTH_LONG).show();
                });
            }
        });
    }

    /**
     * Helper to read a text file from the assets/ folder.
     */
    private String readAssetFile(String fileName) throws IOException {
        try (InputStream is = getAssets().open(fileName);
             BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append("\n");
            }
            return sb.toString();
        }
    }
}
```

---

## 7. Step 6: Understanding the API & Workflow

### The 4-Step Lifecycle
```text
[1. User connects board via OTG]
               ↓
[2. findConnectedDevice()] ─── Returns UsbDevice (matches VID 0x1209, PID 0xC55D)
               ↓
[3. requestPermission()]   ─── Android displays system permission popup dialog
               ↓
[4. flash()]               ─── Background thread runs: Hello → Unlock → Write → Verify CRC → Reboot
               ↓
[Callbacks on FlasherCallback] ── onProgress(), onStatus(), onSuccess(), onError()
```

### Methods Summary

| Method | Parameters | Description |
| :--- | :--- | :--- |
| `new Ch55xHidFlasher(context)` | `Context context` | Creates the flasher instance and initializes Android's `UsbManager`. |
| `findConnectedDevice()` | *none* | Scans attached USB devices and returns the `UsbDevice` matching VID `0x1209` / PID `0xC55D`, or `null` if not found. |
| `hasPermission(device)` | `UsbDevice device` | Returns `true` if your app already has permission to communicate with this device. |
| `requestPermission(device, callback)` | `UsbDevice`, `PermissionCallback` | Displays the system prompt *"Allow app to access USB device?"*. Returns result via callback. |
| `flash(device, hexText, callback)` | `UsbDevice`, `String`, `FlasherCallback` | Parses the hex, verifies size, writes blocks, verifies CRC16, and reboots the board. |

---

## 8. Step 7: Best Practices & Common Pitfalls

### 1. Always use `runOnUiThread()` in Callbacks
The `flasher.flash()` operation runs on a background worker thread (`ExecutorService`) so it doesn't block the UI. All listener methods (`onProgress`, `onStatus`, `onSuccess`, `onError`) are invoked from this background thread. Any attempt to update Views (like `TextView.setText` or `ProgressBar.setProgress`) without `runOnUiThread()` will throw a `CalledFromWrongThreadException`.

### 2. OTG Cable & Adapter Requirement
* Connecting a microcontroller board to a phone requires a **USB OTG (On-The-Go) adapter** or a USB-C to USB-C cable that supports host mode.
* Some Android phones (e.g. OnePlus, OPPO, Vivo) have an **OTG switch** in phone *Settings -> System / Additional Settings -> OTG connection* that turns off automatically after 10 minutes of inactivity. If `findConnectedDevice()` returns `null`, make sure OTG is enabled in system settings.

### 3. Bootloader Entry Timing
* When the CH552 board is plugged into USB, the bootloader waits approximately **3 seconds** for a connection.
* If user code is already flashed on the chip and running, `findConnectedDevice()` won't see the bootloader after the 3-second window expires unless:
  * You plug in the board and immediately tap Flash within 3 seconds.
  * Or you hold **Pin 32 (P3.2)** or **Pin 15 (P1.5)** to **GND** while plugging in the board, which holds it in bootloader mode indefinitely.

### 4. Intel HEX File Size Limit
* The CH552 has 16 KB of flash memory:
  * **0x0000 - 0x2BFF**: User application area (**11 KB / 11,264 bytes**).
  * **0x2C00 - 0x37FF**: Bootloader area (protected).
* `IntelHexParser` will automatically validate your hex file and reject any binary exceeding 11,264 bytes before touching the flash.
