# 11 — Easy Step-by-Step: Adding Blockly as an External Library (3-Block Demo)

This tutorial walks you through creating a brand new Android application in Android Studio, linking the modernized **Native Blockly** library as an external dependency, defining **3 custom blocks** (LED, Delay, and Loop), and generating clean code using Java.

---

## 🎯 What We Are Building

We will create a working visual programming app with **3 custom blocks**:
1. 💡 **LED Block** (`led_toggle`): Sets a GPIO pin (13, 12, 11) to `HIGH` or `LOW`.
2. ⏱️ **Wait Block** (`delay_wait`): Pauses execution for a number of milliseconds.
3. 🔁 **Repeat Block** (`repeat_loop`): Repeats nested statements `N` times in a loop.

When connected and run, they generate runnable Arduino/C code:

```c
for (int i = 0; i < 5; i++) {
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
  delay(1000);
}
```

---

## Step 1: Create a New Android Studio Project

1. Open Android Studio and choose **File > New > New Project...**
2. Select **Empty Views Activity** (or **Phone and Tablet > Empty Views Activity**) and click **Next**.
3. Configure your project:
   - **Name**: `MyBlocklyDemo`
   - **Package name**: `com.example.myblocklydemo`
   - **Save location**: (choose your preferred folder)
   - **Language**: **Java**
   - **Minimum SDK**: **API 21 (Android 5.0)** or higher
   - **Build configuration language**: **Groovy DSL** (or Kotlin DSL)
4. Click **Finish** and wait for the initial Gradle sync to finish.

---

## Step 2: Add the Packaged Blockly Library (`blockly-android.aar`)

The library has been completely packaged into a single, self-contained, production-grade Android archive:  
📁 `blockly_android_research/dist/blockly-android.aar`

This single archive contains the full Blockly engine, Vertical UI block renderer, and pure-Java AST code generator, with **zero deprecations**, **no flavor configurations**, and **no multi-module complexity**.

### How to Add It in 1 Step:

1. In your new project, navigate to `app/libs/` (create the `libs` folder under `app/` if it doesn't exist).
2. Copy `blockly_android_research/dist/blockly-android.aar` into your `app/libs/` folder.
3. In your `app/build.gradle` (or `app/build.gradle.kts`), add it to `dependencies`:

```groovy
dependencies {
    // 🚀 The single packaged Blockly Android library
    implementation files('libs/blockly-android.aar')

    // Standard AndroidX libraries used by Blockly UI
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'androidx.recyclerview:recyclerview:1.3.2'
    implementation 'androidx.annotation:annotation:1.7.0'
    implementation 'androidx.fragment:fragment:1.6.2'
    implementation 'androidx.drawerlayout:drawerlayout:1.2.0'
    implementation 'com.google.android.material:material:1.11.0'
}
```

*(Or if you use Maven Local after running `./gradlew publishToMavenLocal`:)*
```groovy
repositories {
    google()
    mavenCentral()
    mavenLocal()
}

dependencies {
    implementation 'com.google.blockly.android:blockly:1.0.0'
}
```

---

## Step 3: Configure `app/build.gradle` and `gradle.properties`

Make sure `compileOptions` specifies Java 17 (or Java 21):
```groovy
android {
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
}
```

### 2. Update `gradle.properties`
Open `gradle.properties` in your new project and add:

```properties
android.useAndroidX=true
android.nonTransitiveRClass=false
android.overridePathCheck=true
android.sync.suppressAgpWarnings=UNSUPPORTED_PROJECT_OPTION_USE
```

Click **Sync Now** (the elephant icon 🐘 in the top-right toolbar).

---

## Step 4: Create the 3 Custom Blocks JSON

1. In Android Studio's Project view, right-click `app/src/main` > **New > Directory** > type: `assets/default`.
2. Right-click the newly created `assets/default` folder > **New > File** > name it **`my_3_blocks.json`**.
3. Paste the following JSON definitions:

```json
[
  {
    "type": "led_toggle",
    "message0": "turn LED on pin %1 to %2",
    "args0": [
      {
        "type": "field_dropdown",
        "name": "PIN",
        "options": [
          ["13 (Built-in)", "13"],
          ["12", "12"],
          ["11", "11"],
          ["10", "10"]
        ]
      },
      {
        "type": "field_dropdown",
        "name": "STATE",
        "options": [
          ["HIGH (ON)", "HIGH"],
          ["LOW (OFF)", "LOW"]
        ]
      }
    ],
    "previousStatement": null,
    "nextStatement": null,
    "colour": 20,
    "tooltip": "Turn an LED on or off on a specific pin."
  },
  {
    "type": "delay_wait",
    "message0": "wait %1 milliseconds",
    "args0": [
      {
        "type": "field_number",
        "name": "DELAY_MS",
        "value": 1000,
        "min": 0,
        "max": 60000
      }
    ],
    "previousStatement": null,
    "nextStatement": null,
    "colour": 120,
    "tooltip": "Pause execution for a duration."
  },
  {
    "type": "repeat_loop",
    "message0": "repeat %1 times do %2",
    "args0": [
      {
        "type": "field_number",
        "name": "COUNT",
        "value": 5,
        "min": 1,
        "max": 1000
      },
      {
        "type": "input_statement",
        "name": "DO"
      }
    ],
    "previousStatement": null,
    "nextStatement": null,
    "colour": 210,
    "tooltip": "Repeat nested actions multiple times."
  }
]
```

---

## Step 5: Create the Toolbox XML

1. In the same `assets/default/` folder, right-click > **New > File** > name it **`toolbox.xml`**.
2. Paste the following XML structure:

```xml
<toolbox>
    <category name="Hardware" colour="20">
        <block type="led_toggle" />
        <block type="delay_wait" />
    </category>

    <category name="Control" colour="210">
        <block type="repeat_loop" />
    </category>
</toolbox>
```

---

## Step 6: Write `MainActivity.java`

Open `app/src/main/java/com/example/myblocklydemo/MainActivity.java`.  
Replace its contents with the following:

```java
package com.example.myblocklydemo;

import android.os.Bundle;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;

import com.google.blockly.android.AbstractBlocklyActivity;
import com.google.blockly.android.codegen.JavaCodeGenerator;
import com.google.blockly.android.ui.BlockViewFactory;
import com.google.blockly.android.ui.vertical.VerticalBlockViewFactory;
import com.google.blockly.model.Workspace;

import java.util.Collections;
import java.util.List;

public class MainActivity extends AbstractBlocklyActivity {

    @NonNull
    @Override
    protected List<String> getBlockDefinitionsJsonPaths() {
        // Point to our 3-block JSON file inside assets/
        return Collections.singletonList("default/my_3_blocks.json");
    }

    @NonNull
    @Override
    protected String getToolboxContentsXmlPath() {
        // Point to our toolbox XML inside assets/
        return "default/toolbox.xml";
    }

    @NonNull
    @Override
    protected BlockViewFactory onCreateViewFactory() {
        // Vertical Scratch-style block renderer
        return new VerticalBlockViewFactory(this, getWorkspaceHelper());
    }

    @Override
    protected void onRunCode() {
        Workspace workspace = getWorkspace();
        if (workspace == null || workspace.getRootBlocks().isEmpty()) {
            Toast.makeText(this, "Drag some blocks into the workspace first!", Toast.LENGTH_SHORT).show();
            return;
        }

        // Initialize our Pure-Java Code Generator
        JavaCodeGenerator generator = new JavaCodeGenerator();

        // 1. Visitor for Block 1: led_toggle
        generator.registerBlockVisitor("led_toggle", (block, gen) -> {
            String pin = gen.getFieldValue(block, "PIN");
            String state = gen.getFieldValue(block, "STATE");
            return "digitalWrite(" + pin + ", " + state + ");\n";
        });

        // 2. Visitor for Block 2: delay_wait
        generator.registerBlockVisitor("delay_wait", (block, gen) -> {
            String ms = gen.getFieldValue(block, "DELAY_MS");
            return "delay(" + ms + ");\n";
        });

        // 3. Visitor for Block 3: repeat_loop
        generator.registerBlockVisitor("repeat_loop", (block, gen) -> {
            String count = gen.getFieldValue(block, "COUNT");
            String body = gen.statementToCode(block, "DO");
            return "for (int i = 0; i < " + count + "; i++) {\n"
                    + body
                    + "}\n";
        });

        // Generate the code from the workspace AST in pure Java!
        String generatedCode = generator.workspaceToCode(workspace);

        // Display the generated Arduino/C code in a dialog
        new AlertDialog.Builder(this)
                .setTitle("Generated Arduino C Code")
                .setMessage(generatedCode)
                .setPositiveButton("OK", null)
                .show();
    }
}
```

---

## Step 7: Update `AndroidManifest.xml`

Make sure `app/src/main/AndroidManifest.xml` has an explicit `android:exported="true"` for your activity:

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application
        android:allowBackup="true"
        android:label="My Blockly Demo"
        android:supportsRtl="true"
        android:theme="@style/Theme.AppCompat.Light.DarkActionBar">

        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:configChanges="orientation|screenSize">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

    </application>

</manifest>
```

---

## Step 8: Run and Test! ▶️

1. In Android Studio, select your target device / emulator in the top toolbar.
2. Click the green **Run ▶️** button (or press `Shift + F10`).
3. When the app launches:
   - Tap the **Control** category drawer and drag out a **`repeat 5 times do`** block.
   - Tap the **Hardware** category drawer and drag a **`turn LED on pin 13 to HIGH`** block inside the repeat block.
   - Drag a **`wait 1000 milliseconds`** block directly underneath it.
   - Drag a **`turn LED on pin 13 to LOW`** block and another **`wait 1000 milliseconds`** block.
4. Tap the **Play (▶️)** button in the top action bar.
5. An `AlertDialog` will pop up immediately showing your generated C code:

```c
for (int i = 0; i < 5; i++) {
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
  delay(1000);
}
```

🎉 **Congratulations!** You now have a complete, custom native Blockly app running with your own 3 blocks and 100% pure-Java code generation!
