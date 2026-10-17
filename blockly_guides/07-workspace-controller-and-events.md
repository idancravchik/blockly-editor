# 07 — Workspace Controller, Events & Variables

This guide explains how to programmatically control the workspace, listen to user actions in real time, and manage variables and procedures using **`BlocklyController`** in Java.

---

## 1. The `BlocklyController` Role

`BlocklyController` (`com.google.blockly.android.control.BlocklyController`) is the central coordinator for all workspace state changes. It manages:
- Block creation, positioning, and deletion
- Block snapping, connection, and disconnection
- The Undo and Redo history stack
- Variable name tracking and scopes
- Broadcasting workspace events to listeners

You obtain the controller inside `AbstractBlocklyActivity` using:

```java
BlocklyController controller = getController();
```

---

## 2. Programmatic Workspace Actions

### A. Resetting or Clearing the Workspace
```java
// Clears all blocks, resets variables, and empties undo history
getController().resetWorkspace();
```

### B. Undo and Redo
Native Blockly tracks an internal stack of changes:

```java
BlocklyController controller = getController();

if (controller.canUndo()) {
    controller.undo();
}

if (controller.canRedo()) {
    controller.redo();
}
```

### C. Programmatic Block Creation
You can instantiate blocks from code without user drag-and-drop:

```java
BlockFactory factory = getController().getBlockFactory();

// Create an instance of a block defined in JSON
Block newBlock = factory.obtainBlock("set_led_state");

// Add to the workspace at coordinates (x: 100, y: 150)
getController().addRootBlock(newBlock);
newBlock.setPosition(100, 150);
```

---

## 3. Listening to Workspace Events (`BlocklyEvent`)

Whenever a user moves, edits, connects, or deletes a block, `BlocklyController` dispatches a `BlocklyEvent`. You can listen to these events to trigger auto-saving, update a live code preview, or validate rules:

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    // Register an event callback on the controller
    getController().registerCallback(new BlocklyController.EventsCallback() {
        @Override
        public void onEvent(BlocklyEvent event) {
            switch (event.getTypeId()) {
                case BlocklyEvent.TYPE_MOVE:
                    // Block was moved or connected to another block
                    onWorkspaceChanged();
                    break;

                case BlocklyEvent.TYPE_CHANGE:
                    // Field value changed (e.g. dropdown, text input)
                    onWorkspaceChanged();
                    break;

                case BlocklyEvent.TYPE_CREATE:
                    // New block added to canvas
                    break;

                case BlocklyEvent.TYPE_DELETE:
                    // Block deleted or dragged to trash
                    onWorkspaceChanged();
                    break;

                case BlocklyEvent.TYPE_UI:
                    // UI interaction (e.g. category selected, mutator opened)
                    break;
            }
        }
    });
}

private void onWorkspaceChanged() {
    // Generate code in real-time or trigger auto-save
    JavaCodeGenerator generator = new JavaCodeGenerator();
    // ...
    String code = generator.workspaceToCode(getWorkspace());
    // Update live preview TextView or state
}
```

---

## 4. Managing Variables in Java

Variables in Native Blockly are scoped strings tracked by the `Workspace`.

### Default Variable Lifecycle
When a user opens the **Variables** category tab, the library displays options to:
1. "Create variable..."
2. Select existing variables in `field_variable` dropdowns

Native Blockly provides `DefaultVariableCallback` which automatically displays native Android dialogs (`NameVariableDialog` and `DeleteVariableDialog`).

### Customizing Variable Dialogs
If you want to validate variable names (e.g. enforcing valid C/Arduino identifiers) or restrict characters, implement a custom callback:

```java
getController().setVariableCallback(new VariableRequestCallback() {
    @Override
    public void onVariableRequest(int requestType, String variable,
                                  VariableRequestCallback.VariableCallback cb) {
        if (requestType == REQUEST_NEW) {
            // Show custom dialog asking for variable name
            showCustomNewVariableDialog(name -> {
                // Validate C identifier: cannot start with number, no spaces
                if (name.matches("^[a-zA-Z_][a-zA-Z0-9_]*$")) {
                    cb.onVariableSelected(name);
                } else {
                    Toast.makeText(MainActivity.this, 
                        "Invalid identifier name!", Toast.LENGTH_SHORT).show();
                }
            });
        } else if (requestType == REQUEST_RENAME) {
            // Show rename dialog
        } else if (requestType == REQUEST_DELETE) {
            // Show delete confirmation dialog
        }
    }
});
```

---

## 5. Functions & Procedures

When the `<category custom="PROCEDURE" />` tag is included in `toolbox.xml`, Native Blockly enables procedure definition blocks (`procedures_defnoreturn` and `procedures_defreturn`).

- Users can add arguments to functions by clicking the mutator icon on the block, which launches a native dialog (`ProcedureDefinitionMutatorFragment`).
- When a new function is defined, a matching caller block (`procedures_callnoreturn`) appears dynamically in the toolbox.

---

## Next Steps
Proceed to [**08 — Saving & Loading Workspaces**](file:///c:/Users/jnux9/OneDrive/שולחN%20העבודה/DevboxV1/blockly_guides/08-saving-and-loading-workspaces.md) to persist blocks to device storage and restore saved projects.
