# 08 — Saving & Loading Workspaces

This guide explains how to serialize Native Blockly workspaces to XML, store them in Android internal storage or Room databases, and reload saved projects upon app startup.

---

## 1. Serialization Format (Blockly XML)

Native Blockly uses standard Blockly XML serialization. This makes saved files **100% interoperable** with Web Blockly, meaning a workspace saved on Android can be opened in Web Blockly or vice versa.

### Sample Serialized XML

```xml
<xml xmlns="http://www.w3.org/1999/xhtml">
  <block type="set_led_state" id="B1" x="120" y="80">
    <field name="PIN">13</field>
    <field name="STATE">HIGH</field>
    <next>
      <block type="delay_milliseconds" id="B2">
        <value name="DELAY_MS">
          <shadow type="math_number" id="S1">
            <field name="NUM">1000</field>
          </shadow>
        </value>
      </block>
    </next>
  </block>
</xml>
```

---

## 2. Saving the Workspace to Storage

Use `BlocklyXmlHelper` to serialize the active `Workspace` into an XML stream:

### Saving to Internal Storage (`Context.getFilesDir()`)

```java
import com.google.blockly.utils.BlocklyXmlHelper;
import java.io.FileOutputStream;
import java.io.IOException;

public void saveWorkspaceToFile(String filename) {
    try (FileOutputStream fos = openFileOutput(filename, Context.MODE_PRIVATE)) {
        // Serialize the in-memory Workspace directly to the file stream
        BlocklyXmlHelper.writeToXml(getWorkspace(), fos);
        Toast.makeText(this, "Saved successfully!", Toast.LENGTH_SHORT).show();
    } catch (IOException | BlockLoadingException e) {
        Log.e("Blockly", "Failed to save workspace", e);
        Toast.makeText(this, "Failed to save: " + e.getMessage(), Toast.LENGTH_LONG).show();
    }
}
```

### Serializing to a String (for Room / SharedPreferences / Cloud)

```java
import com.google.blockly.utils.BlocklyXmlHelper;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

public String serializeWorkspaceToString() {
    try {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        BlocklyXmlHelper.writeToXml(getWorkspace(), baos);
        return baos.toString(StandardCharsets.UTF_8.name());
    } catch (Exception e) {
        Log.e("Blockly", "Serialization error", e);
        return null;
    }
}
```

---

## 3. Loading a Workspace into the Controller

To restore blocks onto the canvas from an XML stream, use `BlocklyController.loadWorkspaceContents(InputStream)`:

### Loading from Internal Storage

```java
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public void loadWorkspaceFromFile(String filename) {
    try (FileInputStream fis = openFileInput(filename)) {
        // Clears the current canvas and populates the saved blocks
        getController().loadWorkspaceContents(fis);
        Toast.makeText(this, "Project loaded!", Toast.LENGTH_SHORT).show();
    } catch (FileNotFoundException e) {
        Log.w("Blockly", "Save file not found, starting with empty workspace.");
    } catch (BlockLoadingException | IOException e) {
        Log.e("Blockly", "Failed to parse workspace XML", e);
    }
}
```

### Loading from an XML String

```java
import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;

public void loadWorkspaceFromString(String xmlContent) {
    if (xmlContent == null || xmlContent.trim().isEmpty()) {
        return;
    }
    try {
        ByteArrayInputStream bais = new ByteArrayInputStream(
                xmlContent.getBytes(StandardCharsets.UTF_8));
        getController().loadWorkspaceContents(bais);
    } catch (BlockLoadingException e) {
        Log.e("Blockly", "Failed to load blocks", e);
    }
}
```

---

## 4. Built-in Saving in `AbstractBlocklyActivity`

`AbstractBlocklyActivity` provides built-in hooks for saving and loading:

```java
public class MainActivity extends AbstractBlocklyActivity {

    private static final String DEFAULT_SAVE_FILENAME = "autosave_workspace.xml";

    @Override
    protected void onSaveWorkspace() {
        // Called when user selects "Save" from the action bar menu
        saveWorkspaceToFile(DEFAULT_SAVE_FILENAME);
    }

    @Override
    protected void onLoadWorkspace() {
        // Called when user selects "Load" from the action bar menu
        loadWorkspaceFromFile(DEFAULT_SAVE_FILENAME);
    }

    @Override
    protected void onClearWorkspace() {
        // Called when user selects "Clear" or "Reset"
        super.onClearWorkspace(); // Resets canvas and variables
    }

    @Override
    protected void onPause() {
        super.onPause();
        // Autosave whenever the user navigates away from the app
        saveWorkspaceToFile(DEFAULT_SAVE_FILENAME);
    }
}
```

---

## 5. Exporting & Importing via Android Storage Access Framework (SAF)

To let users export `.blockly` or `.xml` project files to Google Drive, SD card, or Downloads:

```java
// 1. Launch File Picker for Exporting
Intent exportIntent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
exportIntent.addCategory(Intent.CATEGORY_OPENABLE);
exportIntent.setType("text/xml");
exportIntent.putExtra(Intent.EXTRA_TITLE, "MyProject.blockly");
startActivityForResult(exportIntent, REQUEST_EXPORT_FILE);

// 2. Write to Selected Document Uri
@Override
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    if (requestCode == REQUEST_EXPORT_FILE && resultCode == RESULT_OK && data != null) {
        Uri uri = data.getData();
        try (OutputStream os = getContentResolver().openOutputStream(uri)) {
            BlocklyXmlHelper.writeToXml(getWorkspace(), os);
            Toast.makeText(this, "Exported successfully!", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Log.e("Blockly", "Export failed", e);
        }
    }
}
```

---

## Next Steps
Proceed to [**09 — Native Styling, Themes & Touch UX**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/09-mobile-and-touch-optimizations.md) to customize visual appearances and gestures.
