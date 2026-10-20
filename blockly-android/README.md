# Blockly Android Module (Clean Library)

Modern, ultra-fast, native Android Blockly module built with pure Android Canvas & Views.
- **Zero WebViews / Zero JavaScript / Zero overhead**
- **Modern Android standard**: AndroidX, Java 17, minSdk 21, compileSdk 34
- **JSON-driven**: Define blocks in `blocks.json` and categories in `categories.json`
- **Instant Code Generation**: High-performance C / Arduino / Python code emission
- **Full Touch Support**: Smooth multi-touch pinch-to-zoom, infinite pan, snapping, field dialogs

---

## Quick Setup in Any Android Studio Project

### 1. Copy the `blockly-android` folder into your project root
Copy the entire `blockly-android/` folder next to your `app/` folder.

### 2. Include the module in `settings.gradle`
```groovy
include ':app'
include ':blockly-android'
```

### 3. Add dependency in `app/build.gradle`
```groovy
dependencies {
    implementation project(':blockly-android')
}
```

### 4. Add `BlocklyView` to your XML layout
```xml
<com.blockly.android.BlocklyView
    android:id="@+id/blocklyView"
    android:layout_width="match_parent"
    android:layout_height="match_parent" />
```

### 5. Initialize in your Activity / Fragment
Place `blocks.json` and `categories.json` in your app's `src/main/assets/` directory:
```java
BlocklyView blocklyView = findViewById(R.id.blocklyView);
blocklyView.initFromAssets("blocks.json", "categories.json");

// Generate code anytime!
String generatedCode = blocklyView.generateCode();

// React to workspace changes in real-time
blocklyView.setOnWorkspaceChangedListener(() -> {
    String liveCode = blocklyView.generateCode();
    Log.d("Blockly", "Code updated: " + liveCode);
});
```
