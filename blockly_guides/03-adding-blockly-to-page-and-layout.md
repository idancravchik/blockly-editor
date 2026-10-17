# 03 — Adding Blockly to an Activity & Layout

This guide explains how to display a native visual block programming interface in an Android screen using Java, either by inheriting from `AbstractBlocklyActivity` for rapid development, or by embedding modular fragments (`WorkspaceFragment` and `FlyoutFragment`) into a custom layout.

---

## 1. Approach 1: Extending `AbstractBlocklyActivity` (Recommended)

The simplest and most robust way to build a Blockly screen is extending `AbstractBlocklyActivity`. It automatically constructs:
- A pan-and-zoom `WorkspaceFragment`
- A collapsible toolbox `FlyoutFragment` with category tabs
- An interactive trash can and zoom floating buttons
- Standard action bar buttons (Clear, Save, Load, Run)
- Automatic state restoration on orientation change

### Java Implementation

```java
package com.example.myblocklyapp;

import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;

import com.google.blockly.android.AbstractBlocklyActivity;
import com.google.blockly.android.codegen.JavaCodeGenerator;
import com.google.blockly.android.control.BlocklyController;
import com.google.blockly.android.ui.BlockViewFactory;
import com.google.blockly.android.ui.vertical.VerticalBlockViewFactory;

import java.util.Arrays;
import java.util.List;

public class MainActivity extends AbstractBlocklyActivity {

    private static final List<String> BLOCK_DEFINITIONS = Arrays.asList(
            "default/default_blocks.json"
    );

    @NonNull
    @Override
    protected List<String> getBlockDefinitionsJsonPaths() {
        // Paths relative to app/src/main/assets/
        return BLOCK_DEFINITIONS;
    }

    @NonNull
    @Override
    protected String getToolboxContentsXmlPath() {
        // Path to your toolbox configuration in assets/
        return "default/toolbox.xml";
    }

    @NonNull
    @Override
    protected BlockViewFactory onCreateViewFactory() {
        // Use the vertical Scratch-style block renderer
        return new VerticalBlockViewFactory(this, getWorkspaceHelper());
    }

    @Override
    protected void onRunCode() {
        // Called when the user clicks the "Run" or "Play" action bar icon
        JavaCodeGenerator generator = new JavaCodeGenerator();
        
        // Register custom block visitors (explained in Guide 06)
        generator.registerBlockVisitor("math_number", (block, gen) -> {
            String num = gen.getFieldValue(block, "NUM");
            return num != null ? num : "0";
        });

        // Generate code in pure Java
        String generatedCode = generateCodeWithJava(generator);

        // Display or execute the result
        new AlertDialog.Builder(this)
                .setTitle("Generated Code")
                .setMessage(generatedCode.isEmpty() ? "Workspace is empty!" : generatedCode)
                .setPositiveButton("OK", null)
                .show();
    }
}
```

### Layout Customization
By default, `AbstractBlocklyActivity` inflates `R.layout.drawers_and_action_bar`. You can override `onCreateContentView(int)` to add custom headers, status bars, or extra buttons:

```java
@Override
protected View onCreateContentView(int parentId) {
    View root = getLayoutInflater().inflate(R.layout.my_custom_blockly_screen, null);
    // Custom header buttons or views
    return root;
}
```

---

## 2. Approach 2: Custom Layout & Modular Fragment Embedding

If you need Blockly inside a tabbed view, a fragment in a ViewPager, or alongside other Android controls, embed the fragments directly in your layout XML.

### Layout XML (`res/layout/activity_custom_blockly.xml`)

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.drawerlayout.widget.DrawerLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/drawer_layout"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Main Workspace Area -->
    <androidx.coordinatorlayout.widget.CoordinatorLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <androidx.fragment.app.FragmentContainerView
            android:id="@+id/blockly_workspace"
            android:name="com.google.blockly.android.WorkspaceFragment"
            android:layout_width="match_parent"
            android:layout_height="match_parent" />

        <!-- Floating Action Button for Code Execution -->
        <com.google.android.material.floatingactionbutton.FloatingActionButton
            android:id="@+id/fab_run"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="bottom|end"
            android:layout_margin="16dp"
            android:contentDescription="Run Code"
            android:src="@android:drawable/ic_media_play" />

    </androidx.coordinatorlayout.widget.CoordinatorLayout>

    <!-- Side Navigation Flyout (Toolbox Drawer) -->
    <androidx.fragment.app.FragmentContainerView
        android:id="@+id/blockly_toolbox_flyout"
        android:name="com.google.blockly.android.FlyoutFragment"
        android:layout_width="300dp"
        android:layout_height="match_parent"
        android:layout_gravity="start" />

</androidx.drawerlayout.widget.DrawerLayout>
```

### Connecting Fragments via `BlocklyActivityHelper`

When building a custom Activity from `AppCompatActivity`, use `BlocklyActivityHelper` to coordinate the controller, fragments, and touch events:

```java
package com.example.myblocklyapp;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

import com.google.blockly.android.BlocklyActivityHelper;
import com.google.blockly.android.FlyoutFragment;
import com.google.blockly.android.WorkspaceFragment;
import com.google.blockly.android.control.BlocklyController;
import com.google.blockly.android.ui.vertical.VerticalBlockViewFactory;

import java.util.Collections;

public class CustomBlocklyActivity extends AppCompatActivity {

    private BlocklyActivityHelper mHelper;
    private WorkspaceFragment mWorkspaceFragment;
    private FlyoutFragment mFlyoutFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_custom_blockly);

        mWorkspaceFragment = (WorkspaceFragment) getSupportFragmentManager()
                .findFragmentById(R.id.blockly_workspace);
        mFlyoutFragment = (FlyoutFragment) getSupportFragmentManager()
                .findFragmentById(R.id.blockly_toolbox_flyout);

        // Build the helper
        mHelper = new BlocklyActivityHelper.Builder(this)
                .setWorkspaceFragment(mWorkspaceFragment)
                .setNavigationDrawer(findViewById(R.id.drawer_layout), R.id.blockly_toolbox_flyout)
                .setBlockDefinitionsJsonPaths(Collections.singletonList("default/default_blocks.json"))
                .setToolboxContentsXmlPath("default/toolbox.xml")
                .setViewFactory(new VerticalBlockViewFactory(this, null))
                .build();

        // Wire Run Button
        findViewById(R.id.fab_run).setOnClickListener(v -> {
            BlocklyController controller = mHelper.getController();
            // Execute code generation with controller.getWorkspace()
        });
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        mHelper.onSaveInstanceState(outState);
    }
}
```

---

## 3. Handling Screen Orientation & State Preservation

By default, an orientation change destroys and recreates the Android Activity. Native Blockly handles this seamlessly:

1. **State Preservation**: `AbstractBlocklyActivity` automatically serializes the active workspace into an XML string bundle during `onSaveInstanceState(Bundle)`. When the activity recreates, `onRestoreInstanceState(Bundle)` reloads all blocks and their exact pan/zoom positions.
2. **Preventing Full Reloads (Optional)**: If you prefer the Activity not to destroy on rotation, add `android:configChanges="orientation|screenSize"` to your activity in `AndroidManifest.xml`. `VirtualWorkspaceView` will adjust its canvas dimensions dynamically.

---

## Next Steps
Proceed to [**04 — Configuring Workspace and Toolbox**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/04-configuring-workspace-and-toolbox.md) to customize categories, blocks, and flyout styles.
