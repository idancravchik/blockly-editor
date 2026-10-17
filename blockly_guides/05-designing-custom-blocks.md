# 05 — Designing Custom Blocks

This guide explains how to define, design, and register custom blocks in Native Blockly for Android using JSON specifications.

---

## 1. Block Definition Format (JSON)

In Native Blockly, blocks are defined using JSON files placed in your Android `assets/` folder (e.g., `app/src/main/assets/default/custom_blocks.json`).

### Block Anatomy

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
          ["Pin 13 (Built-in)", "13"],
          ["Pin 12", "12"],
          ["Pin 11", "11"],
          ["Pin 10", "10"]
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
    "tooltip": "Turn an LED on or off on a specific GPIO pin."
  }
]
```

### Key Definition Attributes
1. **`type`**: The unique identifier for this block type (used in `toolbox.xml` and in your Java code generator).
2. **`message0`**: The display string shown on the block. Placeholders (`%1`, `%2`, etc.) correspond by index to elements in `args0`.
3. **`args0`**: An array of fields and input connectors mapped to `%1`, `%2`, etc.
4. **`previousStatement` / `nextStatement`**: Declares that this block is a statement that can be stacked above and below other blocks. Set to `null` to accept any statement, or provide a string/array to restrict connection types.
5. **`output`**: Marks this block as a value expression returning data (e.g. `"Number"`, `"Boolean"`, `"String"`, or `null`). A block cannot have both `previousStatement` and `output`.
6. **`colour`**: Hue angle (`0` to `360`) or hex string (`"#FF5722"`).

---

## 2. Field Types in Native Android

Fields are the interactive UI widgets rendered inside a block:

| Field Type | JSON Definition | Android UI Element | Example Use Case |
| :--- | :--- | :--- | :--- |
| **`field_label`** | `{"type": "field_label", "text": "repeat"}` | Native `TextView` | Descriptive text labels |
| **`field_input`** | `{"type": "field_input", "name": "VAR_NAME", "text": "item"}` | Native `EditText` dialog | Variable names, identifiers |
| **`field_number`**| `{"type": "field_number", "name": "PORT", "value": 80, "min": 1, "max": 65535}` | Numeric keyboard editor | Numeric constants, pin numbers |
| **`field_dropdown`**| `{"type": "field_dropdown", "name": "MODE", "options": [["Read","R"],["Write","W"]]}` | Android `Spinner` / popup | Selectable options |
| **`field_checkbox`**| `{"type": "field_checkbox", "name": "ENABLE", "checked": true}` | Native `CheckBox` | Boolean toggles |
| **`field_colour`**  | `{"type": "field_colour", "name": "RGB", "colour": "#ff0000"}` | Color grid dialog | LED / RGB colors |
| **`field_variable`**| `{"type": "field_variable", "name": "VAR", "variable": "item"}` | Variable selection spinner | Variables list |

---

## 3. Input Sockets: Values vs. Statements

Inputs allow other blocks to connect into this block:

### A. Value Input (`input_value`)
Used for mathematical expressions, conditions, and calculations:

```json
{
  "type": "read_analog_sensor",
  "message0": "read analog sensor on pin %1",
  "args0": [
    {
      "type": "input_value",
      "name": "PIN",
      "check": "Number"
    }
  ],
  "output": "Number",
  "colour": 180
}
```

### B. Statement Input (`input_statement`)
Used for loops, if-conditions, and code bodies that contain sequences of statements:

```json
{
  "type": "timer_every_ms",
  "message0": "every %1 ms do %2",
  "args0": [
    {
      "type": "input_value",
      "name": "INTERVAL",
      "check": "Number"
    },
    {
      "type": "input_statement",
      "name": "DO"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 60
}
```

---

## 4. Registering Block Definitions in Java

To make your custom blocks available in your application, add the asset path to `getBlockDefinitionsJsonPaths()`:

```java
public class MainActivity extends AbstractBlocklyActivity {

    @NonNull
    @Override
    protected List<String> getBlockDefinitionsJsonPaths() {
        return Arrays.asList(
            "default/default_blocks.json",  // Standard Math, Logic, Loops
            "default/custom_blocks.json"   // Your custom hardware/domain blocks
        );
    }

    @NonNull
    @Override
    protected String getToolboxContentsXmlPath() {
        return "default/toolbox.xml";
    }

    // ...
}
```

Then reference the new block type in `toolbox.xml`:

```xml
<category name="Hardware" colour="20">
    <block type="set_led_state" />
    <block type="timer_every_ms">
        <value name="INTERVAL">
            <shadow type="math_number">
                <field name="NUM">1000</field>
            </shadow>
        </value>
    </block>
</category>
```

---

## Next Steps
Proceed to [**06 — Writing Block Logic & Pure-Java Code Generators**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/06-writing-block-logic-and-c-generators.md) to implement the execution logic that converts these blocks into runnable code.
