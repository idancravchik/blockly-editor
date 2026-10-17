# 09 — Native Styling, Themes & Touch UX

This guide explains how Native Blockly optimizes visual styling, multi-touch gestures, haptic feedback, and layout density for mobile phones and tablets.

---

## 1. Native Rendering vs. Web SVGs

Unlike Web Blockly, which renders vector SVG elements inside an HTML DOM, Native Blockly renders puzzle blocks using native Android 9-patch drawables, bitmaps, and custom layout views:

- **`VerticalBlockViewFactory`**: Constructs the view hierarchy for each block.
- **`PatchManager`**: Loads and recolors 9-patch slice drawables representing block tops, bottoms, puzzle tabs, notches, and statement brackets.
- **`VirtualWorkspaceView`**: A custom Android `ViewGroup` that transforms child block views according to the current canvas scale and pan offset.

Because blocks are native Android views, they take full advantage of **GPU hardware acceleration**, producing fluid 60fps / 120fps dragging and snapping even with hundreds of blocks on screen.

---

## 2. Multi-Touch Gestures & Navigation

`VirtualWorkspaceView` distinguishes between canvas navigation and block interaction:

```
+--------------------------------------------------------------+
|                    TOUCH GESTURE RECOGNITION                 |
+-------------------+------------------------------------------+
| Gesture           | Action                                   |
+-------------------+------------------------------------------+
| 1 Finger on Block | Drags the block or block stack (`Dragger`)|
| 1 Finger on Canvas| Pans / scrolls the workspace             |
| 2 Finger Pinch    | Zooms in / zooms out smoothly            |
| Fast Swipe        | Inertial fling scrolling with deceleration|
| Drag over Trash   | Opens trash lid, drops block to delete   |
+-------------------+------------------------------------------+
```

### Configuring Zoom Levels
You can customize the minimum and maximum allowable zoom scales on `WorkspaceHelper`:

```java
WorkspaceHelper helper = getWorkspaceHelper();

// Adjust zoom bounds (e.g. 50% to 250%)
helper.setMinScale(0.5f);
helper.setMaxScale(2.5f);

// Programmatic zoom control
helper.zoomIn();
helper.zoomOut();
helper.resetView();
```

---

## 3. Snapping Proximity & Touch Feedback

`Dragger` (`com.google.blockly.android.ui.Dragger`) manages the physics of dragging blocks and determining valid connection points.

### Snapping Zones
As a dragged block approaches a matching socket or notch, Native Blockly:
1. Calculates Euclidean distance to nearest compatible connections.
2. When within the snapping radius (typically 20-30dp), draws a highlighted yellow glow over the target connection.
3. Upon release, snaps the block into position and recalculates the AST tree.

### Adding Haptic Feedback on Snap
To provide a tactile sensation when blocks snap together, add haptic feedback to your workspace events:

```java
getController().registerCallback(new BlocklyController.EventsCallback() {
    @Override
    public void onEvent(BlocklyEvent event) {
        if (event.getTypeId() == BlocklyEvent.TYPE_MOVE) {
            BlocklyEvent.Move moveEvent = (BlocklyEvent.Move) event;
            // If the block was newly connected to a parent
            if (moveEvent.getNewParentId() != null) {
                View workspaceView = getWorkspaceFragment().getView();
                if (workspaceView != null) {
                    workspaceView.performHapticFeedback(
                            HapticFeedbackConstants.KEYBOARD_TAP);
                }
            }
        }
    }
});
```

---

## 4. Density Independence & Screen Adaptations

Native Blockly supports screens ranging from 5-inch smartphones to 12-inch tablets:

### Phone Layout vs. Tablet Layout

| Feature | Smartphones (<= 6 inches) | Tablets (>= 7 inches) |
| :--- | :--- | :--- |
| **Toolbox Placement** | Bottom Drawer (`R.layout.default_flyout_bottom`) | Side Navigation Drawer (`R.layout.drawers_and_action_bar`) |
| **Default Zoom Scale** | `1.1f` - `1.3f` (Larger tap targets) | `1.0f` (Full overview) |
| **Flyout Width** | Match parent or 80% screen width | Fixed `300dp` side pane |

You can dynamically adapt the layout in `onCreateContentView`:

```java
@Override
protected View onCreateContentView(int parentId) {
    boolean isTablet = getResources().getConfiguration().smallestScreenWidthDp >= 600;
    if (isTablet) {
        return getLayoutInflater().inflate(R.layout.drawers_and_action_bar, null);
    } else {
        return getLayoutInflater().inflate(R.layout.default_flyout_bottom, null);
    }
}
```

---

## 5. Hardware Acceleration & Memory Optimization

To ensure maximum smoothness on lower-end devices:

1. **Hardware Acceleration**: Ensure `android:hardwareAccelerated="true"` is enabled in your `AndroidManifest.xml` (default on modern Android).
2. **View Recycling**: The toolbox uses an Android `RecyclerView` (`BlockRecyclerViewHelper`), meaning only the blocks currently visible on screen allocate Android Views, keeping memory overhead minimal.

---

## Next Steps
Proceed to [**10 — Complete Working Starter Example**](file:///c:/Users/jnux9/OneDrive/שולחן%20העבודה/DevboxV1/blockly_guides/10-complete-working-starter-example.md) for a complete, production-ready sample application.
