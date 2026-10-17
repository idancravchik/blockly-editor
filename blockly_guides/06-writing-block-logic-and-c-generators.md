# 06 — Writing Block Logic & Pure-Java Code Generators

This guide explains how to generate target programming code (such as C, Arduino, Python, or Java) directly from Native Blockly blocks using the modernized **`JavaCodeGenerator`** and **`BlockVisitor`** framework in pure Java—with zero WebViews, zero JavaScript, and zero external runtime dependencies.

---

## 1. The Pure-Java Code Generator Architecture

In Native Blockly, the workspace model is a tree of strongly-typed Java objects. `JavaCodeGenerator` implements the classic Visitor pattern:

```
+-------------------------------------------------------------+
|                     JavaCodeGenerator                       |
|                                                             |
|  workspaceToCode(Workspace workspace)                       |
|   └── Iterates root blocks: workspace.getRootBlocks()       |
|                                                             |
|  blockToCode(Block block)                                   |
|   ├── Calls registered BlockVisitor for block.getType()     |
|   └── Follows sequence: block.getNextBlock()                |
|                                                             |
|  statementToCode(Block block, String statementName)         |
|   └── Recurses down statement socket + indents lines ("  ") |
|                                                             |
|  valueToCode(Block block, String inputName)                 |
|   └── Recurses down value socket to produce an expression   |
|                                                             |
|  getFieldValue(Block block, String fieldName)               |
|   └── Extracts text, number, or key from named Field        |
+-------------------------------------------------------------+
```

### The `BlockVisitor` Interface

```java
package com.google.blockly.android.codegen;

import com.google.blockly.model.Block;

public interface BlockVisitor {
    /**
     * Converts a Block AST node into a target code string.
     *
     * @param block The block being visited.
     * @param generator The active generator for recursive lookups.
     * @return Generated code string for this block.
     */
    String visit(Block block, JavaCodeGenerator generator);
}
```

---

## 2. Implementing Visitors for Common Block Types

### 1. Value Blocks (Expressions)
Value blocks return a code snippet without semicolons or line breaks:

```java
// Math Number: 42 -> "42"
generator.registerBlockVisitor("math_number", (block, gen) -> {
    String num = gen.getFieldValue(block, "NUM");
    return num != null ? num : "0";
});

// Logic Boolean: TRUE -> "true"
generator.registerBlockVisitor("logic_boolean", (block, gen) -> {
    String boolVal = gen.getFieldValue(block, "BOOL");
    return "TRUE".equalsIgnoreCase(boolVal) ? "true" : "false";
});

// Binary Arithmetic: (A + B)
generator.registerBlockVisitor("math_arithmetic", (block, gen) -> {
    String a = gen.valueToCode(block, "A");
    String b = gen.valueToCode(block, "B");
    String op = gen.getFieldValue(block, "OP"); // ADD, MINUS, MULTIPLY, DIVIDE
    
    if (a.isEmpty()) a = "0";
    if (b.isEmpty()) b = "0";

    String symbol = "+";
    if ("MINUS".equals(op)) symbol = "-";
    else if ("MULTIPLY".equals(op)) symbol = "*";
    else if ("DIVIDE".equals(op)) symbol = "/";

    return "(" + a + " " + symbol + " " + b + ")";
});
```

### 2. Standalone Statement Blocks (Commands)
Statement blocks execute an action and end with a newline `\n`:

```java
// Hardware LED: digitalWrite(13, HIGH);
generator.registerBlockVisitor("set_led_state", (block, gen) -> {
    String pin = gen.getFieldValue(block, "PIN");
    String state = gen.getFieldValue(block, "STATE");
    return "digitalWrite(" + pin + ", " + state + ");\n";
});

// Delay: delay(1000);
generator.registerBlockVisitor("delay_milliseconds", (block, gen) -> {
    String ms = gen.valueToCode(block, "DELAY_MS");
    if (ms.isEmpty()) ms = "1000";
    return "delay(" + ms + ");\n";
});
```

> [!NOTE]
> `blockToCode()` automatically follows `block.getNextBlock()`. You only need to emit code for the current block; sequential chaining is handled automatically.

### 3. Control Flow & Branching (Nested Statements)
Blocks with nested statements use `statementToCode()`, which automatically handles 2-space indentation:

```java
// Repeat Loop: for (int i = 0; i < 10; i++) { ... }
generator.registerBlockVisitor("controls_repeat_ext", (block, gen) -> {
    String times = gen.valueToCode(block, "TIMES");
    if (times.isEmpty()) times = "10";
    
    String body = gen.statementToCode(block, "DO");
    
    return "for (int i = 0; i < " + times + "; i++) {\n"
            + body
            + "}\n";
});

// If-Condition
generator.registerBlockVisitor("controls_if", (block, gen) -> {
    String condition = gen.valueToCode(block, "IF0");
    if (condition.isEmpty()) condition = "false";
    
    String thenBranch = gen.statementToCode(block, "DO0");
    StringBuilder sb = new StringBuilder();
    sb.append("if (").append(condition).append(") {\n");
    sb.append(thenBranch);
    sb.append("}");

    // Check for optional ELSE branch
    if (block.getInputByName("ELSE") != null) {
        String elseBranch = gen.statementToCode(block, "ELSE");
        sb.append(" else {\n");
        sb.append(elseBranch);
        sb.append("}");
    }
    sb.append("\n");
    return sb.toString();
});
```

### 4. Variables
Variables read from or write to named identifiers:

```java
// Set Variable: x = value;
generator.registerBlockVisitor("variables_set", (block, gen) -> {
    String varName = gen.getFieldValue(block, "VAR");
    String val = gen.valueToCode(block, "VALUE");
    if (val.isEmpty()) val = "0";
    return varName + " = " + val + ";\n";
});

// Get Variable: x
generator.registerBlockVisitor("variables_get", (block, gen) -> {
    String varName = gen.getFieldValue(block, "VAR");
    return varName != null ? varName : "item";
});
```

---

## 3. Assembling a Complete Arduino Sketch

To generate a complete, valid C/Arduino program (with `#include`, `setup()`, and `loop()`), wrap the generator in a helper class:

```java
package com.example.myblocklyapp;

import com.google.blockly.android.codegen.JavaCodeGenerator;
import com.google.blockly.model.Workspace;

public class ArduinoCodeBuilder {

    public static String buildFullSketch(Workspace workspace) {
        JavaCodeGenerator generator = new JavaCodeGenerator();
        registerVisitors(generator);

        // Generate user statements from workspace blocks
        String userCode = generator.workspaceToCode(workspace);

        StringBuilder sketch = new StringBuilder();
        sketch.append("// Auto-generated by Native Blockly for Android\n");
        sketch.append("#include <Arduino.h>\n\n");

        sketch.append("void setup() {\n");
        sketch.append("  pinMode(13, OUTPUT);\n");
        sketch.append("  Serial.begin(9600);\n");
        sketch.append("}\n\n");

        sketch.append("void loop() {\n");
        if (userCode.trim().isEmpty()) {
            sketch.append("  // Empty workspace\n");
        } else {
            sketch.append(generator.prefixLines(userCode, "  "));
        }
        sketch.append("}\n");

        return sketch.toString();
    }

    private static void registerVisitors(JavaCodeGenerator generator) {
        // Register all block visitors here...
    }
}
```

---

## 4. Triggering Code Generation in Your Activity

In your `MainActivity` (extending `AbstractBlocklyActivity`):

```java
@Override
protected void onRunCode() {
    Workspace workspace = getWorkspace();
    if (workspace == null || workspace.getRootBlocks().isEmpty()) {
        Toast.makeText(this, "Workspace is empty!", Toast.LENGTH_SHORT).show();
        return;
    }

    String arduinoSketch = ArduinoCodeBuilder.buildFullSketch(workspace);

    // Display in a dialog or send via USB / Bluetooth
    new AlertDialog.Builder(this)
            .setTitle("Generated Arduino Code")
            .setMessage(arduinoSketch)
            .setPositiveButton("OK", null)
            .show();
}
```

---

## Next Steps
Proceed to [**07 — Workspace Controller, Events & Variables**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/07-workspace-controller-and-events.md) to manage workspace state, events, and variables programmatically.
