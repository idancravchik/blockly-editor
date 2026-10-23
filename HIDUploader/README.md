# CH552 Driverless USB HID Flasher & Bootloader

A complete, production-grade, zero-driver flashing ecosystem for the **WCH CH552** (MCS-51 8051 USB microcontroller) using the standard **USB HID (Human Interface Device)** class.

Designed specifically to flash CH55xduino sketches directly from **Android phones, web browsers, and desktop PCs** without drivers, Zadig, or operating system restrictions.

---

## 🌟 Why USB HID?

| Parameter | Standard CDC (COM / Serial) | WCH Factory Bootloader (`4348:55e0`) | **CH552 USB HID (This Project)** |
| :--- | :--- | :--- | :--- |
| **Android Phones** | Requires constant permission prompts on every reset | Requires vendor Bulk driver | **Zero-driver & Plug-and-play** |
| **Web Browsers** | Limited serial support | Requires custom WebUSB WinUSB driver | **Native WebHID (Chrome, Edge, Opera)** |
| **Windows PC** | Installs COM port | Requires Zadig / WinUSB | **100% Driverless out-of-the-box** |
| **iOS / Tablets** | Completely blocked | Blocked | **Standard HID Peripheral class** |
| **Flash Speed** | ~1.5 - 2.5 seconds | ~1.2 seconds | **< 1.0 second (Full Speed 12 Mbps)** |

---

## 📁 Repository Structure

```text
HIDUploader/
├── firmware/                          # CH552 USB HID Bootloader Firmware
│   ├── src/
│   │   ├── bootloader.c               # Top-level unified translation unit
│   │   ├── usb_hid.c / usb_hid.h      # 64-byte Raw HID USB engine (EP0 & EP1)
│   │   ├── iap_flash.c / iap_flash.h  # Safe RAM-resident Flash IAP write engine
│   │   └── ch552.h / ch552_usb.h      # Official SFR register definitions
│   ├── build/
│   │   ├── ch552_hid_bootloader.bin   # 14 KB Raw Binary for programmers / etching (Base 0x0000)
│   │   ├── ch552_hid_bootloader_16k.bin # 16 KB Full Image for 16KB programmer buffers
│   │   ├── ch552_hid_bootloader_offset_0x2c00.bin # 3 KB Partition for tools setting offset 0x2C00
│   │   └── ch552_hid_bootloader.hex   # Intel HEX format (< 2.4 KB code)
│   ├── demos/                         # Precompiled hardware-free test firmwares
│   │   ├── demo_serial_a.hex / .bin   # Sends 'A' over USB CDC & UART0 every 1s
│   │   └── demo_serial_b.hex / .bin   # Sends 'B' over USB CDC & UART0 every 1s
│   └── Makefile                       # SDCC build configuration
│
├── web/                               # WebHID Browser Flasher (PWA)
│   ├── index.html                     # Responsive web app UI (Mobile & Desktop)
│   ├── css/style.css                  # Clean dark-themed CSS
│   ├── js/
│   │   ├── ch55x-hid-flasher.js       # Reusable standalone WebHID flasher library
│   │   ├── hex-parser.js              # In-browser Intel HEX (.hex) parser
│   │   └── app.js                     # UI controller & event handlers
│   └── manifest.json                  # PWA Manifest (installable on phone homescreen)
│
├── android/                           # Android Native Library (Java) & Demo App
│   ├── ch55x-hid-flasher/             # Reusable pure Java Android Library module
│   │   ├── build.gradle.kts
│   │   ├── AndroidManifest.xml
│   │   └── src/main/java/com/devbox/ch55x/
│   │       ├── Ch55xHidFlasher.java   # USB Host HID Flasher engine
│   │       ├── IntelHexParser.java    # Native Intel HEX parser
│   │       └── FlasherCallback.java   # Progress & completion listeners
│   └── sample-app/                    # Complete Android sample application
│       ├── build.gradle.kts
│       ├── AndroidManifest.xml
│       └── src/main/
│           ├── java/com/devbox/sample/
│           │   ├── MainActivity.java  # Sample UI logic in Java
│           │   └── DemoHexPresets.java# Embedded precompiled 'A' and 'B' hex strings
│           └── res/layout/activity_main.xml
│
├── python/                            # Cross-Platform CLI Tool
│   └── ch55x_hid_cli.py               # Terminal flasher via hidapi
│
├── USAGE.md                           # Quick-start integration guide for Android developers
└── README.md                          # Complete developer documentation
```

---

## ⚡ Step 0: Initial One-Time Bootloader Setup (Burning / Etching)

Every brand new CH552 board from the factory comes with WCH's default bootloader in ROM. To enable driverless USB HID flashing, you flash our bootloader **once**:

### Option A: Flashing using `.bin` (Minipro, TL866, T48, WCHISPTool)
- **Base Address `0x0000` (Standard / Recommended)**:
  Load [`firmware/build/ch552_hid_bootloader.bin`](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/HIDUploader/firmware/build/ch552_hid_bootloader.bin) (14 KB Flash image). The first 11 KB is padded with `0xFF` and the bootloader starts at offset `0x2C00`.
- **Full 16 KB Buffer**:
  Load [`firmware/build/ch552_hid_bootloader_16k.bin`](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/HIDUploader/firmware/build/ch552_hid_bootloader_16k.bin) (16,384 bytes) if your programmer requires a 16 KB file.
- **Partition Offset `0x2C00`**:
  Load [`firmware/build/ch552_hid_bootloader_offset_0x2c00.bin`](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/HIDUploader/firmware/build/ch552_hid_bootloader_offset_0x2c00.bin) (3,072 bytes) if your programmer has an offset setting and you enter start address `0x2C00`.

### Option B: Flashing using `.hex` (`vnproch55x` or WCHISPTool)
1. Connect the CH552 board to your PC with **Pin 36 (D+)** or **Boot Button** held high to 5V during power-up.
2. Flash the compiled bootloader binary:
   ```bash
   vnproch55x -r 2 -t CH552 -c 3 firmware/build/ch552_hid_bootloader.hex
   ```

3. **Done!** From this moment onward, the board will permanently present itself across Windows, Android, Mac, and Linux as:
   - **USB Product**: **Idan's DevBoard**
   - **VID/PID**: `1209:C55D`
   - **Class**: Standard USB HID (Zero-driver & plug-and-play)

---

## 🌐 Step-by-Step Testing Guide: Web (WebHID)

The web flasher runs in **Google Chrome**, **Microsoft Edge**, or **Opera** (on desktop and Chromium-supported devices) without installing anything.

### Step 1: Start the Local Web Server
Open a terminal in the project directory and run:
```bash
cd web
python -m http.server 8000
```

### Step 2: Open the Web Page
Open your browser and navigate to:
```text
http://localhost:8000
```

### Step 3: Connect the Board
1. Plug your CH552 board into the computer or phone (via USB-C or OTG adapter).
2. Click **Connect Device**.
3. In the browser permission pop-up, choose **Idan's DevBoard** (`1209:c55d`) and click **Connect**.
4. You will see the green status badge change to **Connected**, displaying:
   - **Microcontroller**: `Idan's DevBoard (0x52)`
   - **Bootloader**: `v1.0`
   - **Usable Flash**: `11264 bytes (11 KB)`

### Step 4: Flash a Test Firmware (No LED Needed!)
1. Click **📡 Serial: Send 'A' (every 1s)**.
2. Click **Flash to Idan's DevBoard**.
3. Watch the progress bar advance from 0% to 100% in under 1 second.
4. **Verify the result directly in your browser:**
   - Scroll to **Card 4: Serial Monitor (Virtual COM Port)** on the page.
   - Click **🔌 Open Serial Monitor** (choose the newly appeared USB Serial / COM port in the browser prompt).
   - You will immediately see incoming characters streaming live:
     ```text
     A
     A
     A
     ...
     ```
   *(Alternatively, open any serial terminal like PuTTY or Arduino Serial Monitor set to 115200 baud).*
5. Now click **📡 Serial: Send 'B' (every 1s)** and click **Flash to Idan's DevBoard**.
6. Switch back to Card 4 or your terminal — the board will now send:
   ```text
   B
   B
   B
   ...
   ```

---

## 📱 Step-by-Step Testing Guide: Android Sample App

The sample application (`android/sample-app`) is ready to run directly on your Android phone.

### Step 1: Open the Project in Android Studio
1. Launch Android Studio.
2. Select **Open** and choose the `android` folder (`HIDUploader/android`).
3. Allow Gradle to sync dependencies.

### Step 2: Run on Your Android Device
1. Enable **Developer Options** and **USB Debugging** on your phone.
2. Connect your phone to your development PC.
3. In Android Studio, click **Run 'sample-app'** (`Shift + F10`).

### Step 3: Perform the Physical Flashing Test
1. Disconnect your phone from the PC.
2. Plug your CH552 board into the phone using a **USB-C to USB-A OTG adapter** or direct USB-C cable.
3. Open the **CH552 Flasher** app on your phone.
4. Tap **Flash: Serial Send 'A' Every 1s**.
5. When Android displays the system prompt *"Allow CH552 Flasher to access USB device?"*, tap **OK**.
6. The progress bar will sweep across in under a second and display *"Success! Board is now typing Serial Send 'A' every 1s"*.
7. **Verify the result:** Plug the board into any serial terminal app on Android (such as *Serial USB Terminal* from Google Play) or PC (PuTTY / Arduino Serial Monitor at 115200 baud) — you will see the character **`A`** received every second!
8. Tap **Flash: Serial Send 'B' Every 1s** in the app. The phone will instantly reflash the chip, and the character **`B`** will start transmitting!

---

## 💻 Detailed Guide: How to Integrate into Any Java Android App

You can add this flashing engine to any existing or new Android app written in **Java** in just a few minutes.

### Step 1: Add the Library to Your Project

#### Option A: Copy Java Files Directly (Fastest)
Copy the following three files from `android/ch55x-hid-flasher/src/main/java/com/devbox/ch55x/` into your app's package (e.g. `app/src/main/java/your/package/name/`):
- `Ch55xHidFlasher.java`
- `IntelHexParser.java`
- `FlasherCallback.java`

#### Option B: Include as a Module
In your `settings.gradle.kts` (or `settings.gradle`), add:
```kotlin
include(":ch55x-hid-flasher")
project(":ch55x-hid-flasher").projectDir = file("path/to/android/ch55x-hid-flasher")
```
In your app's `build.gradle` (or `build.gradle.kts`), add:
```kotlin
dependencies {
    implementation(project(":ch55x-hid-flasher"))
}
```

---

### Step 2: Configure `AndroidManifest.xml`
In your `app/src/main/AndroidManifest.xml`, declare that your application utilizes USB Host:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.yourcompany.yourapp">

    <!-- Declare USB Host capability -->
    <uses-feature
        android:name="android.hardware.usb.host"
        android:required="true" />

    <application ...>
        <!-- Your activities -->
    </application>
</manifest>
```

---

### Step 3: Implement the Flashing Logic in Your Activity

Here is the complete Java implementation for your Activity:

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

public class MyFlasherActivity extends AppCompatActivity {

    private Ch55xHidFlasher flasher;
    private ProgressBar progressBar;
    private TextView statusTextView;
    private Button flashButton;

    // Example: Your sketch compiled to Intel HEX string
    private final String firmwareHex = 
        ":10000000020008000000000012001575B000120038\n" +
        ":100015007590001200380200157580007581072230\n" +
        ":00000001FF";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_flasher);

        // 1. Initialize the flasher instance
        flasher = new Ch55xHidFlasher(this);

        progressBar = findViewById(R.id.progressBar);
        statusTextView = findViewById(R.id.statusTextView);
        flashButton = findViewById(R.id.flashButton);

        flashButton.setOnClickListener(v -> checkAndFlash());
    }

    private void checkAndFlash() {
        // 2. Discover connected CH552 device (VID: 0x1209, PID: 0xC55D)
        UsbDevice device = flasher.findConnectedDevice();

        if (device == null) {
            Toast.makeText(this, "CH552 not connected! Plug in via USB OTG.", Toast.LENGTH_SHORT).show();
            statusTextView.setText("No device detected.");
            return;
        }

        // 3. Request user permission
        flasher.requestPermission(device, granted -> {
            if (granted) {
                // 4. Start flashing on permission granted
                runFlashing(device);
            } else {
                Toast.makeText(this, "USB permission denied.", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void runFlashing(UsbDevice device) {
        flashButton.setEnabled(false);
        progressBar.setProgress(0);

        // 5. Execute asynchronous flashing
        flasher.flash(device, firmwareHex, new FlasherCallback() {
            @Override
            public void onProgress(int percent, int currentBytes, int totalBytes) {
                // Runs in background; update UI on Main Thread
                runOnUiThread(() -> {
                    progressBar.setProgress(percent);
                    statusTextView.setText("Writing: " + percent + "% (" + currentBytes + "/" + totalBytes + " B)");
                });
            }

            @Override
            public void onStatus(String message) {
                runOnUiThread(() -> statusTextView.setText(message));
            }

            @Override
            public void onSuccess() {
                runOnUiThread(() -> {
                    flashButton.setEnabled(true);
                    progressBar.setProgress(100);
                    statusTextView.setText("Flashing Successful! CH552 running new code.");
                    Toast.makeText(MyFlasherActivity.this, "Done!", Toast.LENGTH_LONG).show();
                });
            }

            @Override
            public void onError(Throwable error) {
                runOnUiThread(() -> {
                    flashButton.setEnabled(true);
                    statusTextView.setText("Error: " + error.getMessage());
                    Toast.makeText(MyFlasherActivity.this, "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
                });
            }
        });
    }
}
```

---

## 🛠️ How to Compile Custom Sketches in Arduino IDE

You write standard Arduino sketches with **CH55xduino** and export the `.hex` file:

1. Install CH55xduino in Arduino IDE via Board Manager:
   ```text
   https://raw.githubusercontent.com/DeqingSun/ch55xduino/ch55xduino/package_ch55xduino_mcs51_index.json
   ```
2. Select **Tools -> Board -> CH55x Boards -> CH552 Board**.
3. Include the **Auto-Reset listener** in your sketch so Android and Web flashers can switch from CDC Serial to Bootloader automatically:
   ```c
   #include <Serial.h>

   #define BOOTLOADER_MAGIC_BYTE 0xFE

   void jump_to_bootloader(void) {
     EA = 0;
     USB_CTRL = 0;
     UDEV_CTRL = 0;
     for (uint16_t i = 0; i < 50000; i++) { __asm nop __endasm; }
     __asm ljmp 0x2C00 __endasm;
   }

   void setup() { /* your setup */ }

   void loop() {
     if (USBSerial_available()) {
       if (USBSerial_read() == BOOTLOADER_MAGIC_BYTE) {
         jump_to_bootloader();
       }
     }
     // your sketch logic...
   }
   ```
4. Click **Sketch -> Export Compiled Binary** (`Ctrl + Alt + S`).
5. Look in your sketch folder for the `.hex` file (e.g. `MySketch.ino.hex`).
6. Feed that `.hex` file directly to the **Web Flasher** or your **Android App**!

---

## 📌 Bootloader Entry Conditions

1. **Auto-Reset from CDC Serial (Seamless)**:
   - When the board runs a CDC Serial sketch, the Android app or Web Serial sends the magic byte (`0xFE`). The chip resets its USB stack and jumps to `0x2C00`, reconnecting as USB HID (`1209:C55D`) ready for flashing.
2. **Auto-Timeout Window (~4 seconds)**:
   - When entering the bootloader, it waits ~4 seconds for the flasher handshake (`CMD_HELLO`). Once received, the timeout is cancelled and flashing proceeds.
3. **Hardware Boot Button (Pin 32 / P3.2 or Pin 15 / P1.5)**:
   - Connect a push-button between **Pin 32 (P3.2)** or **Pin 15 (P1.5)** and **GND**. Holding this button while jumping or plugging into USB locks the chip into bootloader mode permanently until flashed.
4. **Blank Chip Fallback**:
   - If the user flash partition is blank (`0xFFFF`), the chip stays in bootloader mode automatically.
