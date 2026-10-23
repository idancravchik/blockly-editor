# 🚀 CH552 Android HID Flasher — Quick Start & Usage Guide

A simple, drop-in Java library for Android that flashes **WCH CH552** microcontrollers directly from any Android phone over **USB HID**.

* **Zero Drivers Needed**: Uses Android's built-in USB HID stack (no root, no NDK, no custom drivers).
* **1-Method Automatic Flashing**: Automatically detects the board, requests USB permission, and flashes with real-time UI callbacks.
* **Safe UI Threading**: All callbacks (`onProgress`, `onStatus`, `onSuccess`, `onError`) are automatically delivered on Android's **Main (UI) Thread** — no `runOnUiThread()` required!

---

## 📦 How to Add the Library to Your Project

Choose either of the two easy methods below:

### Method 1: Direct File Drop-in (Fastest — 1 Minute)
Simply copy the core Java files into your app:

1. Copy the folder `com/devbox/ch55x` from:
   ```text
   android/ch55x-hid-flasher/src/main/java/com/devbox/ch55x/
   ```
2. Paste it into your Android project under:
   ```text
   app/src/main/java/com/devbox/ch55x/
   ```
The 3 required files are:
* `Ch55xHidFlasher.java` — The flasher engine and high-level API.
* `IntelHexParser.java` — Intel HEX parser and CRC16 verification engine.
* `FlasherCallback.java` — Listener interface for progress and lifecycle events.

*(No external dependencies needed beyond standard Android SDK!)*

---

### Method 2: Include as a Gradle Module
If you prefer keeping the library as an isolated module:

1. Copy the `android/ch55x-hid-flasher` directory into your Android project's root folder.
2. In your `settings.gradle` (or `settings.gradle.kts`):
   ```groovy
   include ':ch55x-hid-flasher'
   ```
3. In your `app/build.gradle` (or `app/build.gradle.kts`):
   ```groovy
   dependencies {
       implementation project(':ch55x-hid-flasher')
   }
   ```
4. Click **Sync Project with Gradle Files**.

---

## ⚙️ Step 1: Configure `AndroidManifest.xml`

In your `app/src/main/AndroidManifest.xml`, declare that your application supports USB Host:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.yourcompany.yourapp">

    <!-- Enable USB Host capability -->
    <uses-feature
        android:name="android.hardware.usb.host"
        android:required="true" />

    <application ...>
        <!-- Your activities -->
    </application>
</manifest>
```

---

## ⚡ Step 2: Flash Firmware in 1 Line of Code

Place your compiled `.hex` file in your project's assets folder:
```text
app/src/main/assets/firmware.hex
```

Then in your `Activity` or `Fragment`, flash it with a single call to **`flashAsset()`**:

```java
import com.devbox.ch55x.Ch55xHidFlasher;
import com.devbox.ch55x.FlasherCallback;

public class MainActivity extends AppCompatActivity {

    private Ch55xHidFlasher flasher;
    private ProgressBar progressBar;
    private TextView statusText;
    private Button btnFlash;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // 1. Initialize flasher
        flasher = new Ch55xHidFlasher(this);

        progressBar = findViewById(R.id.progressBar);
        statusText = findViewById(R.id.statusText);
        btnFlash = findViewById(R.id.btnFlash);

        btnFlash.setOnClickListener(v -> flashMyBoard());
    }

    private void flashMyBoard() {
        btnFlash.setEnabled(false);
        progressBar.setProgress(0);

        // 2. One-step flashing: detects device, asks permission, and flashes!
        flasher.flashAsset("firmware.hex", new FlasherCallback() {

            @Override
            public void onProgress(int percent, int currentBytes, int totalBytes) {
                // Safely updates UI directly - already on the Main thread!
                progressBar.setProgress(percent);
                statusText.setText("Flashing: " + percent + "% (" + currentBytes + "/" + totalBytes + " B)");
            }

            @Override
            public void onStatus(String message) {
                statusText.setText(message);
            }

            @Override
            public void onSuccess() {
                btnFlash.setEnabled(true);
                progressBar.setProgress(100);
                statusText.setText("Board flashed successfully!");
                Toast.makeText(MainActivity.this, "Flashing Complete!", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onError(Throwable error) {
                btnFlash.setEnabled(true);
                statusText.setText("Error: " + error.getMessage());
                Toast.makeText(MainActivity.this, "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }
}
```

---

## 💡 Flashing from a String Variable (`flashAuto`)

If your firmware is stored as an in-memory string or downloaded from a cloud server, use **`flashAuto(hexString, callback)`**:

```java
String hexContent = ":10000000020008000000000012001575B000120038\n...:00000001FF";

flasher.flashAuto(hexContent, new FlasherCallback() {
    @Override
    public void onProgress(int percent, int currentBytes, int totalBytes) {
        progressBar.setProgress(percent);
    }

    @Override
    public void onStatus(String message) {
        statusText.setText(message);
    }

    @Override
    public void onSuccess() {
        Toast.makeText(MainActivity.this, "Success!", Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onError(Throwable error) {
        Toast.makeText(MainActivity.this, "Failed: " + error.getMessage(), Toast.LENGTH_LONG).show();
    }
});
```

---

## 🛠️ Advanced: Manual Control API

If your app requires manual control over when the USB device is selected or when permission is asked:

```java
// 1. Scan for the CH552 device (VID 0x1209, PID 0xC55D)
UsbDevice device = flasher.findConnectedDevice();
if (device == null) {
    Toast.makeText(this, "Connect CH552 via OTG", Toast.LENGTH_SHORT).show();
    return;
}

// 2. Check or request permission
if (!flasher.hasPermission(device)) {
    flasher.requestPermission(device, granted -> {
        if (granted) {
            startFlashing(device);
        }
    });
} else {
    startFlashing(device);
}

// 3. Flash directly to the UsbDevice instance
private void startFlashing(UsbDevice device) {
    flasher.flash(device, hexString, callback);
}
```

---

## 💻 How to Generate the `.hex` File in Arduino IDE

1. Install **CH55xduino** in Arduino IDE (*File -> Preferences -> Additional Boards Manager URLs*):
   ```text
   https://raw.githubusercontent.com/DeqingSun/ch55xduino/ch55xduino/package_ch55xduino_mcs51_index.json
   ```
2. Select **Tools -> Board -> CH55x Boards -> CH552 Board**.
3. Keep default settings:
   * **Clock Source**: Internal 16MHz (or 24MHz)
   * **USB Settings**: Default CDC
4. In your sketch, include the **Auto-Reset listener** so Android can re-flash the board without physical buttons:
   ```c
   #include <Serial.h>

   #define BOOTLOADER_MAGIC_BYTE 0xFE

   void jump_to_bootloader(void) {
     EA = 0;         // Disable interrupts
     USB_CTRL = 0;   // Shut down USB
     UDEV_CTRL = 0;
     for (uint16_t i = 0; i < 50000; i++) {
       __asm nop __endasm;
     }
     __asm
       ljmp 0x2C00   // Jump to HID Bootloader
     __endasm;
   }

   void setup() {
     // Your setup
   }

   void loop() {
     // Check for flasher reset command
     if (USBSerial_available()) {
       if (USBSerial_read() == BOOTLOADER_MAGIC_BYTE) {
         jump_to_bootloader();
       }
     }

     // Your normal sketch code...
   }
   ```
5. Click **Sketch -> Export Compiled Binary** (`Ctrl + Alt + S`).
6. Copy the `.hex` file from the sketch folder into your Android project's `app/src/main/assets/firmware.hex`.

---

## ❓ Troubleshooting & FAQs

### 1. "Idan's DevBoard (CH552) not found"
* **OTG Adapter**: Microcontrollers require a **USB OTG adapter** or a host-enabled USB-C cable to connect to Android phones.
* **Phone OTG Switch**: On certain Android phones (OnePlus, OPPO, Realme, Vivo), OTG power is disabled by default. Go to **Settings -> System / Additional Settings -> OTG Connection** and turn it **ON**.
* **Boot Window**: On initial power-up, the bootloader waits ~3 seconds for a connection. If the board is already running an old sketch, reconnect the USB cable or connect **Pin 32 (P3.2)** to **GND** while plugging in to lock it in bootloader mode.

### 2. Max Firmware Size
The CH552 user flash is **11 KB (11,264 bytes)**. The bootloader occupies the upper flash (`0x2C00` to `0x37FF`). If your compiled `.hex` exceeds 11 KB, `IntelHexParser` will safely reject it and notify you via `onError()`.
