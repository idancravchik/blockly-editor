# 10 — Complete Working Starter Example

This guide provides a complete, copy-pasteable minimal working **Java Android Studio** application using the modernized **Native Blockly for Android** library and the pure-Java **`JavaCodeGenerator`**.

---

## 1. Project Directory Structure

```
MyBlocklyApp/
├── settings.gradle
├── build.gradle (Project-level)
└── app/
    ├── build.gradle (Module-level)
    └── src/
        └── main/
            ├── AndroidManifest.xml
            ├── assets/
            │   └── default/
            │       ├── default_blocks.json
            │       ├── custom_blocks.json
            │       └── toolbox.xml
            ├── java/
            │   └── com/
            │       └── example/
            │           └── myblocklyapp/
            │               ├── MainActivity.java
            │               └── ArduinoCodeBuilder.java
            └── res/
                └── values/
                    ├── strings.xml
                    └── styles.xml
```

---

## 2. Configuration Files

### `settings.gradle`
```groovy
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "MyBlocklyApp"
include ':app'

// Reference the modernized Native Blockly modules
include ':blocklylib-core'
project(':blocklylib-core').projectDir = new File(settingsDir, '../blockly_android_research/blocklylib-core')

include ':blocklylib-vertical'
project(':blocklylib-vertical').projectDir = new File(settingsDir, '../blockly_android_research/blocklylib-vertical')
```

### Project-level `build.gradle`
```groovy
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:9.3.2'
    }
}

allprojects {
    configurations.all {
        resolutionStrategy {
            force 'org.jetbrains.kotlin:kotlin-stdlib:1.8.22'
            force 'org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.8.22'
            force 'org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.8.22'
        }
    }
}
```

### Module-level `app/build.gradle`
```groovy
apply plugin: 'com.android.application'

android {
    namespace 'com.example.myblocklyapp'
    compileSdk 34

    defaultConfig {
        applicationId "com.example.myblocklyapp"
        minSdk 21
        targetSdk 34
        versionCode 1
        versionName "1.0"
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }

    buildFeatures {
        buildConfig = true
    }
}

dependencies {
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'androidx.recyclerview:recyclerview:1.3.2'
    implementation 'androidx.annotation:annotation:1.7.0'
    implementation 'androidx.fragment:fragment:1.6.2'
    implementation 'androidx.drawerlayout:drawerlayout:1.2.0'
    implementation 'com.google.android.material:material:1.11.0'

    implementation project(':blocklylib-core')
    implementation project(':blocklylib-vertical')
}
```

### `app/src/main/AndroidManifest.xml`
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application
        android:allowBackup="true"
        android:label="Blockly Arduino Demo"
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

## 3. Assets: Toolbox & Custom Blocks

### `app/src/main/assets/default/custom_blocks.json`
```json
[
  {
    "type": "set_led_state",
    "message0": "set LED pin %1 to %2",
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
    "tooltip": "Turn an LED on or off."
  },
  {
    "type": "delay_milliseconds",
    "message0": "wait %1 ms",
    "args0": [
      {
        "type": "input_value",
        "name": "DELAY_MS",
        "check": "Number"
      }
    ],
    "previousStatement": null,
    "nextStatement": null,
    "colour": 120,
    "tooltip": "Pause execution for milliseconds."
  }
]
```

### `app/src/main/assets/default/toolbox.xml`
```xml
<toolbox>
    <category name="Hardware" colour="20">
        <block type="set_led_state" />
        <block type="delay_milliseconds">
            <value name="DELAY_MS">
                <shadow type="math_number">
                    <field name="NUM">1000</field>
                </shadow>
            </value>
        </block>
    </category>

    <category name="Loops" colour="120">
        <block type="controls_repeat_ext">
            <value name="TIMES">
                <shadow type="math_number">
                    <field name="NUM">5</field>
                </shadow>
            </value>
        </block>
    </category>

    <category name="Logic" colour="210">
        <block type="controls_if" />
        <block type="logic_boolean" />
    </category>

    <category name="Math" colour="230">
        <block type="math_number" />
        <block type="math_arithmetic" />
    </category>

    <category name="Variables" custom="VARIABLE" colour="330" />
</toolbox>
```

---

## 4. Java Application Code

### `ArduinoCodeBuilder.java`
```java
package com.example.myblocklyapp;

import com.google.blockly.android.codegen.JavaCodeGenerator;
import com.google.blockly.model.Workspace;

public class ArduinoCodeBuilder {

    public static String buildSketch(Workspace workspace) {
        JavaCodeGenerator generator = new JavaCodeGenerator();
        registerVisitors(generator);

        String userCode = generator.workspaceToCode(workspace);

        StringBuilder sb = new StringBuilder();
        sb.append("// Auto-generated Arduino Sketch\n");
        sb.append("#include <Arduino.h>\n\n");

        sb.append("void setup() {\n");
        sb.append("  pinMode(13, OUTPUT);\n");
        sb.append("  Serial.begin(9600);\n");
        sb.append("}\n\n");

        sb.append("void loop() {\n");
        if (userCode.trim().isEmpty()) {
            sb.append("  // Empty workspace\n");
        } else {
            sb.append(generator.prefixLines(userCode, "  "));
        }
        sb.append("}\n");

        return sb.toString();
    }

    private static void registerVisitors(JavaCodeGenerator generator) {
        // LED Block
        generator.registerBlockVisitor("set_led_state", (block, gen) -> {
            String pin = gen.getFieldValue(block, "PIN");
            String state = gen.getFieldValue(block, "STATE");
            return "digitalWrite(" + pin + ", " + state + ");\n";
        });

        // Delay Block
        generator.registerBlockVisitor("delay_milliseconds", (block, gen) -> {
            String ms = gen.valueToCode(block, "DELAY_MS");
            if (ms.isEmpty()) ms = "1000";
            return "delay(" + ms + ");\n";
        });

        // Repeat Loop
        generator.registerBlockVisitor("controls_repeat_ext", (block, gen) -> {
            String times = gen.valueToCode(block, "TIMES");
            if (times.isEmpty()) times = "10";
            String body = gen.statementToCode(block, "DO");
            return "for (int i = 0; i < " + times + "; i++) {\n" + body + "}\n";
        });

        // Math Number
        generator.registerBlockVisitor("math_number", (block, gen) -> {
            String num = gen.getFieldValue(block, "NUM");
            return num != null ? num : "0";
        });

        // If Condition
        generator.registerBlockVisitor("controls_if", (block, gen) -> {
            String condition = gen.valueToCode(block, "IF0");
            if (condition.isEmpty()) condition = "false";
            String thenBranch = gen.statementToCode(block, "DO0");
            return "if (" + condition + ") {\n" + thenBranch + "}\n";
        });

        // Variables
        generator.registerBlockVisitor("variables_set", (block, gen) -> {
            String var = gen.getFieldValue(block, "VAR");
            String val = gen.valueToCode(block, "VALUE");
            return var + " = " + (val.isEmpty() ? "0" : val) + ";\n";
        });

        generator.registerBlockVisitor("variables_get", (block, gen) -> {
            String var = gen.getFieldValue(block, "VAR");
            return var != null ? var : "item";
        });
    }
}
```

### `MainActivity.java`
```java
package com.example.myblocklyapp;

import android.os.Bundle;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;

import com.google.blockly.android.AbstractBlocklyActivity;
import com.google.blockly.android.ui.BlockViewFactory;
import com.google.blockly.android.ui.vertical.VerticalBlockViewFactory;
import com.google.blockly.model.Workspace;
import com.google.blockly.utils.BlocklyXmlHelper;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Arrays;
import java.util.List;

public class MainActivity extends AbstractBlocklyActivity {

    private static final String SAVE_FILENAME = "saved_workspace.xml";

    @NonNull
    @Override
    protected List<String> getBlockDefinitionsJsonPaths() {
        return Arrays.asList(
                "default/default_blocks.json",
                "default/custom_blocks.json"
        );
    }

    @NonNull
    @Override
    protected String getToolboxContentsXmlPath() {
        return "default/toolbox.xml";
    }

    @NonNull
    @Override
    protected BlockViewFactory onCreateViewFactory() {
        return new VerticalBlockViewFactory(this, getWorkspaceHelper());
    }

    @Override
    protected void onRunCode() {
        Workspace workspace = getWorkspace();
        if (workspace == null || workspace.getRootBlocks().isEmpty()) {
            Toast.makeText(this, "Add blocks to the workspace first!", Toast.LENGTH_SHORT).show();
            return;
        }

        // Generate complete Arduino C sketch in pure Java
        String generatedSketch = ArduinoCodeBuilder.buildSketch(workspace);

        // Display in a scrollable dialog
        new AlertDialog.Builder(this)
                .setTitle("Generated Arduino C Code")
                .setMessage(generatedSketch)
                .setPositiveButton("OK", null)
                .show();
    }

    @Override
    protected void onSaveWorkspace() {
        try (FileOutputStream fos = openFileOutput(SAVE_FILENAME, MODE_PRIVATE)) {
            BlocklyXmlHelper.writeToXml(getWorkspace(), fos);
            Toast.makeText(this, "Workspace saved!", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Toast.makeText(this, "Save error: " + e.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onLoadWorkspace() {
        try (FileInputStream fis = openFileInput(SAVE_FILENAME)) {
            getController().loadWorkspaceContents(fis);
            Toast.makeText(this, "Workspace loaded!", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Toast.makeText(this, "Load error: " + e.getMessage(), Toast.LENGTH_LONG).show();
        }
    }
}
```

---

## 5. Running the Application

1. Open the project in **Android Studio**.
2. Sync Gradle (**File > Sync Project with Gradle Files**).
3. Select an Android device or emulator running **API 21 to 34+**.
4. Press **Run** (Shift+F10).
5. Open the side drawer, drag `set LED pin 13 to HIGH`, `wait 1000 ms`, and `set LED pin 13 to LOW` into the canvas, snapping them together.
6. Click the **Run** (Play) icon in the action bar. The dialog will instantly pop up displaying the complete, valid Arduino C sketch!
