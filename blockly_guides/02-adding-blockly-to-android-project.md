# 02 — Adding Blockly to Your Android Studio Project

This guide provides step-by-step instructions for importing and integrating the modernized Native Blockly library into your **Java Android Studio** application.

---

## 1. Project Prerequisites

Ensure your Android project is configured with modern toolchains:
- **Android Studio**: Quail 3 (2026.1.3), Koala, Ladybug, Meerkat, or newer
- **Android Gradle Plugin (AGP)**: `9.3.2` (or `8.3.0`+)
- **Gradle**: `9.5.0` (or `8.7`+)
- **JDK / JBR**: Java 17, 21, or 25 (bundled Android Studio JBR)
- **Compile SDK**: `compileSdk 34` (Android 14) or newer
- **Minimum SDK**: `minSdk 21` (Android 5.0 Lollipop) or newer

---

## 2. Integration Methods

You can integrate Native Blockly using either **Gradle Project Modules** (recommended for direct debugging and customization) or **Precompiled AARs**.

### Method A: Gradle Project Modules (Recommended)

In this approach, you include the modernized `blocklylib-core` and `blocklylib-vertical` folders directly into your app's Gradle build.

#### Step 1: Update `settings.gradle`
Reference the two library modules from your project:

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

// Include the modernized Blockly modules
include ':blocklylib-core'
project(':blocklylib-core').projectDir = new File(settingsDir, '../blockly_android_research/blocklylib-core')

include ':blocklylib-vertical'
project(':blocklylib-vertical').projectDir = new File(settingsDir, '../blockly_android_research/blocklylib-vertical')
```

> [!TIP]
> You can also copy the `blocklylib-core` and `blocklylib-vertical` folders directly into your project's root folder, in which case `projectDir` customization is not needed.

#### Step 2: Configure Root `build.gradle`
In your root `build.gradle`, enforce modern `kotlin-stdlib` resolution to avoid duplicate class collisions between modern AndroidX and legacy transitive dependencies:

```groovy
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.3.0'
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

#### Step 3: Configure `gradle.properties`
Enable AndroidX in `gradle.properties`:

```properties
android.useAndroidX=true
android.nonTransitiveRClass=false
```

#### Step 4: Add Module Dependencies to `app/build.gradle`
In your application's `app/build.gradle`:

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
    // AndroidX UI dependencies
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'androidx.recyclerview:recyclerview:1.3.2'
    implementation 'androidx.annotation:annotation:1.7.0'
    implementation 'androidx.fragment:fragment:1.6.2'
    implementation 'androidx.drawerlayout:drawerlayout:1.2.0'
    implementation 'com.google.android.material:material:1.11.0'

    // Native Blockly Library Modules
    implementation project(':blocklylib-core')
    implementation project(':blocklylib-vertical')
}
```

---

### Method B: Precompiled AAR Libraries

If you prefer not to include source modules, assemble the `.aar` files:

```powershell
./gradlew :blocklylib-core:assembleRelease
./gradlew :blocklylib-vertical:assembleRelease
```

Then copy the generated files:
- `blocklylib-core/build/outputs/aar/blocklylib-core-full-release.aar`
- `blocklylib-vertical/build/outputs/aar/blocklylib-vertical-full-release.aar`

Into your app's `app/libs/` directory, and add to `app/build.gradle`:

```groovy
dependencies {
    implementation fileTree(dir: 'libs', include: ['*.aar', '*.jar'])
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'androidx.recyclerview:recyclerview:1.3.2'
    implementation 'androidx.annotation:annotation:1.7.0'
    implementation 'androidx.fragment:fragment:1.6.2'
    implementation 'androidx.drawerlayout:drawerlayout:1.2.0'
}
```

---

## 3. Setting Up the Assets Directory

Native Blockly loads toolbox configurations and block definitions from the Android `assets/` directory.

Create the following folder structure inside `app/src/main/`:

```
app/src/main/
├── AndroidManifest.xml
├── java/
│   └── com/example/myblocklyapp/MainActivity.java
├── res/
│   ├── layout/
│   └── values/
└── assets/
    └── default/
        ├── default_blocks.json    <-- Standard or custom block definitions
        └── toolbox.xml            <-- Category and block layout in toolbox
```

You can copy the standard default block definitions from the library:
- Copy `blocklylib-core/src/lite/assets/default/default_blocks.json` into `app/src/main/assets/default/default_blocks.json`
- Copy `blocklydemo/src/main/assets/default/toolbox.xml` into `app/src/main/assets/default/toolbox.xml`

---

## 4. AndroidManifest.xml Requirements

Native Blockly runs locally without requiring network or internet permissions.

Ensure your `AndroidManifest.xml` defines your activity with an explicit `android:exported` attribute (required for Android 12+ / SDK 31+):

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
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

## Next Steps
Now that your project links the Native Blockly library, proceed to [**03 — Adding Blockly to an Activity & Layout**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/03-adding-blockly-to-page-and-layout.md) to set up your UI and workspace.
