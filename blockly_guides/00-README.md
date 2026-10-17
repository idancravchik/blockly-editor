# Native Blockly for Android (Java) — Complete Guide Series

Welcome to the comprehensive developer guide for integrating and building applications with **Google Blockly for Android** using modern **Android Studio**, **Java**, and **AndroidX**.

This documentation series covers the complete lifecycle of developing a visual block-based programming environment natively in Android: importing the modernized `:blocklylib-core` and `:blocklylib-vertical` modules, embedding native block workspaces into Activities and Fragments, configuring toolboxes and custom block definitions, controlling workspaces in Java, and generating code using a 100% pure-Java AST Visitor pattern without any WebViews or JavaScript overhead.

---

## 📚 Table of Contents

| # | Guide | Description |
|---|---|---|
| **01** | [**Architecture & Overview**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/01-blockly-in-android-overview.md) | Architectural comparison between Native Android Blockly and WebViews. How native Android Views, Canvas rendering, and in-memory AST models work with zero JavaScript overhead. |
| **02** | [**Adding Blockly to Your Project**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/02-adding-blockly-to-android-project.md) | Importing `:blocklylib-core` and `:blocklylib-vertical` into an Android Studio project via Gradle modules or AARs. Modern AndroidX and Java 17 configuration. |
| **03** | [**Adding Blockly to an Activity & Layout**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/03-adding-blockly-to-page-and-layout.md) | Rapid setup using `AbstractBlocklyActivity` vs customized modular embedding with `WorkspaceFragment` and `FlyoutFragment`. Layout XML and lifecycle management. |
| **04** | [**Configuring Workspace and Toolbox**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/04-configuring-workspace-and-toolbox.md) | Defining toolboxes in XML (`toolbox.xml`), category tabs, flyouts (start vs bottom drawer), zoom/pan controls, trashcan, and RTL/Hebrew localization. |
| **05** | [**Designing Custom Blocks**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/05-designing-custom-blocks.md) | Creating custom block definitions in JSON (`default_blocks.json`), input types (value, statement, dummy), fields (label, input, number, dropdown, checkbox, color), and block factories. |
| **06** | [**Writing Block Logic & Pure-Java Code Generators**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/06-writing-block-logic-and-c-generators.md) | Generating C, Arduino, Python, or Java code directly in Java using `JavaCodeGenerator` and `BlockVisitor`. Recursively walking AST statements, inputs, and fields without WebViews. |
| **07** | [**Workspace Controller, Events & Variables**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/07-workspace-controller-and-events.md) | Working with `BlocklyController`, listening to block move, delete, and change events, variable lifecycle (`DefaultVariableCallback`), and custom mutator dialogs. |
| **08** | [**Saving & Loading Workspaces**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/08-saving-and-loading-workspaces.md) | Serializing blocks to XML via `BlocklyXmlHelper`, saving to internal storage or databases, autosave patterns, and restoring saved workspaces on startup. |
| **09** | [**Native Styling, Themes & Touch UX**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/09-mobile-and-touch-optimizations.md) | Customizing 9-patch block assets (`PatchManager`), block styles, multi-touch pinch-to-zoom, fling velocity, trash can drag animations, and DPI scaling. |
| **10** | [**Complete Working Starter Example**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/10-complete-working-starter-example.md) | A complete, copy-pasteable minimal Android Studio project: `build.gradle`, `MainActivity.java` extending `AbstractBlocklyActivity`, toolbox XML, custom blocks JSON, and an Arduino code generator. |

---

## 🚀 Architectural Mental Model

```
+--------------------------------------------------------------------------+
|                      Native Android Application (Java)                   |
|                                                                          |
|  +--------------------------------------------------------------------+  |
|  |                       AbstractBlocklyActivity                      |  |
|  |                                                                    |  |
|  |  +-----------------------------+     +--------------------------+  |  |
|  |  |      FlyoutFragment         |     |     WorkspaceFragment    |  |  |
|  |  |  - BlockRecyclerViewHelper  |     |  - VirtualWorkspaceView  |  |  |
|  |  |  - CategoryTabs             |     |  - BlockView hierarchy   |  |  |
|  |  +-----------------------------+     +--------------------------+  |  |
|  |                 |                                 |                |  |
|  |                 +----------------+----------------+                |  |
|  |                                  v                                 |  |
|  |                       BlocklyController (Java)                     |  |
|  |                 - Workspace model manipulation                     |  |
|  |                 - Undo / Redo stack                                |  |
|  |                 - Drag & Connection management                     |  |
|  +--------------------------------------------------------------------+  |
|                                     |                                    |
|                                     v In-memory AST Model                |
|  +--------------------------------------------------------------------+  |
|  |                     Workspace / Block / Input / Field              |  |
|  +--------------------------------------------------------------------+  |
|                                     |                                    |
|                                     v Pure-Java AST Visitor              |
|  +--------------------------------------------------------------------+  |
|  |                        JavaCodeGenerator                           |  |
|  |  - BlockVisitor ("controls_if", "set_led_state", "math_number")    |  |
|  |  - Recursively resolves statements (DO) and values (EXPR)          |  |
|  |  - ZERO WebViews, ZERO JavaScript engines, 100% synchronous Java   |  |
|  +--------------------------------------------------------------------+  |
|                                     |                                    |
|                                     v Output: C / Arduino / Python / Java|
|                        "digitalWrite(13, HIGH);\n"                       |
+--------------------------------------------------------------------------+
```

### Key Differences from Web Blockly
1. **100% Native Views**: Blocks are drawn with native Android Views, drawables, and canvas paths—not SVG elements inside a web browser.
2. **Zero IPC / JS Serialization Latency**: Blocks and variables live directly in Android JVM memory as Java objects (`Block`, `Workspace`, `Field`).
3. **Pure-Java Code Generation**: Code is produced immediately in-memory by traversing the AST using Java visitors, with zero thread switching, web sockets, or JavaScript compilation delays.
