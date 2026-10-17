# 04 — Configuring Workspace and Toolbox

This guide explains how to configure categories, blocks, flyouts, and canvas behavior in Native Blockly for Android.

---

## 1. Defining the Toolbox (`toolbox.xml`)

In Native Blockly, the toolbox contents are structured in an XML file placed under `app/src/main/assets/` (e.g. `assets/default/toolbox.xml`).

### XML Structure

```xml
<toolbox>
    <!-- Categorized Blocks -->
    <category name="Logic" colour="210">
        <block type="controls_if" />
        <block type="logic_compare" />
        <block type="logic_operation" />
        <block type="logic_negate" />
        <block type="logic_boolean" />
    </category>

    <category name="Loops" colour="120">
        <block type="controls_repeat_ext">
            <value name="TIMES">
                <!-- Shadow block: Default editable placeholder -->
                <shadow type="math_number">
                    <field name="NUM">10</field>
                </shadow>
            </value>
        </block>
        <block type="controls_whileUntil" />
    </category>

    <category name="Math" colour="230">
        <block type="math_number" />
        <block type="math_arithmetic">
            <value name="A">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
            <value name="B">
                <shadow type="math_number">
                    <field name="NUM">1</field>
                </shadow>
            </value>
        </block>
    </category>

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

    <!-- Dynamic Built-in Categories -->
    <category name="Variables" custom="VARIABLE" colour="330" />
    <category name="Functions" custom="PROCEDURE" colour="290" />
</toolbox>
```

### Key Toolbox Elements
1. **`<category>`**: Groups blocks into selectable tabs.
   - `name`: Visible tab label (can be localized to Hebrew or any language).
   - `colour`: Category hue (`0` to `360`) or hex color code (`#4CAF50`).
   - `custom="VARIABLE"`: Automatically populates variable creation buttons and existing variables.
   - `custom="PROCEDURE"`: Automatically populates function definition and caller blocks.
2. **`<block>`**: Declares an available block by its `type` ID defined in your block JSON files.
3. **`<shadow>`**: A placeholder block embedded inside an input socket that users can edit or overwrite by dragging another block over it.

---

## 2. Toolbox Drawer & Flyout Layouts

Native Blockly supports two toolbox orientations:

```
+------------------------------------+  +------------------------------------+
|  [Tabs] |                          |  |                                    |
|  Logic  |                          |  |                                    |
|  Loops  |       WORKSPACE          |  |             WORKSPACE              |
|  Math   |        CANVAS            |  |              CANVAS                |
|  -------|                          |  |                                    |
| [Flyout]|                          |  +------------------------------------+
| Block 1 |                          |  | Logic | Loops | Math | Hardware    |
| Block 2 |                          |  | [=========== FLYOUT =============] |
+------------------------------------+  +------------------------------------+
       Side Drawer (Start)                        Bottom Drawer
```

### Changing Flyout Orientation
In `AbstractBlocklyActivity`, override `onCreateContentView(int)` or configure your layout to use either start drawer or bottom drawer:

```java
// For a bottom flyout (ideal for phone screens)
@Override
protected View onCreateContentView(int parentId) {
    return getLayoutInflater().inflate(R.layout.default_flyout_bottom, null);
}

// For a side drawer (default, ideal for tablets)
// Inflates R.layout.drawers_and_action_bar automatically
```

---

## 3. Workspace Controls: Pan, Zoom & Grid

The `VirtualWorkspaceView` provides built-in multi-touch gestures and zoom management:

```java
WorkspaceHelper helper = getWorkspaceHelper();

// 1. Zoom Controls
helper.setZoomScale(1.2f); // Set specific zoom level (1.0 = 100%)
helper.zoomIn();
helper.zoomOut();
helper.resetView();

// 2. Pan & Scroll Coordinate Space
helper.setVirtualWorkspacePosition(0, 0); // Center canvas at origin
```

### Trash Can & Quick Delete
- In `AbstractBlocklyActivity`, an animated `TrashCanView` is automatically placed at the bottom corner.
- Dragging any block tree over the trash can triggers an open-lid animation and highlights red.
- Dropping the block deletes the block tree and registers an undo step on `BlocklyController`.
- Tapping the trash can opens a popup displaying recently deleted blocks, allowing the user to restore them.

---

## 4. RTL (Right-to-Left) & Hebrew Localization

Native Blockly supports Android's native RTL layout mirroring for Hebrew and Arabic:

1. **Manifest Support**: Ensure `android:supportsRtl="true"` is set in your `AndroidManifest.xml`.
2. **Category Names**: You can write Hebrew directly in `toolbox.xml`:
   ```xml
   <category name="לוגיקה" colour="210">
       <block type="controls_if" />
   </category>
   <category name="לולאות" colour="120">
       <block type="controls_repeat_ext" />
   </category>
   <category name="חומרה" colour="20">
       <block type="set_led_state" />
   </category>
   <category name="משתנים" custom="VARIABLE" colour="330" />
   ```
3. **Block Connector Direction**: In RTL mode, horizontal connectors and notches are automatically mirrored to read naturally from right to left.

---

## Next Steps
Proceed to [**05 — Designing Custom Blocks**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/05-designing-custom-blocks.md) to create custom domain-specific blocks for your project.
