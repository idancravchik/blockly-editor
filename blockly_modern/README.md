# Modern Blockly Android (Native Java)

A brand-new, ultra-lightweight, high-performance visual block-coding library for Android.
Built completely from scratch to eliminate the 10-year-old legacy codebase, deprecation warnings, complex flavors, and WebViews.

---

## 🌟 Why Modern Blockly?

| Feature | Legacy Google Blockly Android (2015) | **Modern Blockly Android (2026)** |
|---|---|---|
| **Architecture** | Ancient Eclipse / Support Library | Modern AndroidX & Material 3 |
| **Setup Complexity** | Multi-module, `missingDimensionStrategy`, flavor dimensions | **1 single drop-in View** (`BlocklyView`) |
| **Configuration** | Complex XML schemas + fragmented JSONs | **1 `blocks.json` + 1 `categories.json`** |
| **Code Generation** | Slow headless WebView + JavaScript | **Instant, pure Java AST code generator** |
| **Rendering** | Blurry 9-patch bitmap slices from 2015 | **Razor-sharp vector Canvas Paths** |
| **Library Size** | Heavy (>1.5 MB with legacy assets) | **Ultra-lightweight (~31 KB .aar)** |
| **Java Compatibility** | Stuck on Java 7/8 hacks | **Java 17, 21, and 25** |

---

## 🚀 Quick Start (Add to your project in 1 minute)

### Option 1: Drop-in AAR (Easiest)
1. Copy `blockly-modern.aar` from `dist/` into your app's `app/libs/` folder.
2. In your `app/build.gradle`:
   ```groovy
   dependencies {
       implementation files('libs/blockly-modern.aar')
       implementation 'androidx.appcompat:appcompat:1.6.1'
       implementation 'com.google.android.material:material:1.11.0'
   }
   ```

### Option 2: Maven Local
If you run `./gradlew :blockly:publishToMavenLocal`:
```groovy
repositories {
    google()
    mavenCentral()
    mavenLocal()
}
dependencies {
    implementation 'com.devbox.blockly:blockly:1.0.0'
}
```

---

## 🎨 2. Configuration (The Easiest JSON Ever)

Put two files in your `app/src/main/assets/` folder:

### `assets/blocks.json`
Define your blocks in simple, clear JSON:
```json
[
  {
    "type": "led_toggle",
    "message": "Set LED on pin %1 to %2",
    "color": "#4CAF50",
    "fields": [
      { "name": "PIN", "type": "dropdown", "options": ["13", "12", "11", "10"], "default": "13" },
      { "name": "STATE", "type": "dropdown", "options": ["HIGH", "LOW"], "default": "HIGH" }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "digitalWrite(%PIN%, %STATE%);\n"
  },
  {
    "type": "delay_wait",
    "message": "Wait %1 ms",
    "color": "#FF9800",
    "fields": [
      { "name": "MS", "type": "number", "default": 1000 }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "delay(%MS%);\n"
  },
  {
    "type": "repeat_loop",
    "message": "Repeat %1 times",
    "color": "#2196F3",
    "fields": [
      { "name": "COUNT", "type": "number", "default": 5 }
    ],
    "statements": [
      { "name": "DO" }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "for (int i = 0; i < %COUNT%; i++) {\n%DO%}\n"
  }
]
```

### `assets/categories.json`
Group your blocks into color-coded categories:
```json
[
  {
    "id": "hardware",
    "name": "Hardware",
    "color": "#4CAF50",
    "blocks": ["led_toggle"]
  },
  {
    "id": "timing",
    "name": "Timing",
    "color": "#FF9800",
    "blocks": ["delay_wait"]
  },
  {
    "id": "control",
    "name": "Control",
    "color": "#2196F3",
    "blocks": ["repeat_loop"]
  }
]
```

---

## 📱 3. Embedding Into a Screen (Minimum Mess)

### In your Layout XML (`activity_main.xml`):
```xml
<com.devbox.blockly.BlocklyView
    android:id="@+id/blocklyView"
    android:layout_width="match_parent"
    android:layout_height="match_parent" />
```

### In your Activity (`MainActivity.java`):
```java
public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        BlocklyView blocklyView = findViewById(R.id.blocklyView);

        // 1-Line Setup:
        blocklyView.initFromAssets("blocks.json", "categories.json");

        // Generate Code anytime:
        String code = blocklyView.generateCode();

        // Listen for changes:
        blocklyView.setOnWorkspaceChangedListener(() -> {
            String updatedCode = blocklyView.generateCode();
            Log.d("Blockly", "Generated Code:\n" + updatedCode);
        });
    }
}
```
