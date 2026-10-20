package com.devbox.blockly.view;

import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.widget.EditText;
import androidx.appcompat.app.AlertDialog;
import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockInstance;
import com.devbox.blockly.model.FieldDef;
import com.devbox.blockly.model.Workspace;

import java.util.List;

public class WorkspaceCanvasView extends View {

    public interface OnWorkspaceListener {
        void onWorkspaceChanged();
        void onBlockSelected(BlockInstance block);
    }

    private Workspace workspace = new Workspace();
    private final BlockRenderer renderer = new BlockRenderer();

    // Pan & Zoom
    private float panX = 40f;
    private float panY = 40f;
    private float scale = 1.0f;
    private ScaleGestureDetector scaleDetector;

    // Dragging state
    private BlockInstance draggingBlock = null;
    private float touchStartX, touchStartY;
    private float blockStartOffsetX, blockStartOffsetY;
    private boolean isPanning = false;

    // Snap target
    private BlockInstance snapParent = null;
    private boolean snapToStatement = false;

    private OnWorkspaceListener listener;
    private final Paint gridPaint = new Paint();

    public WorkspaceCanvasView(Context context) {
        super(context);
        init(context);
    }

    public WorkspaceCanvasView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    private void init(Context context) {
        gridPaint.setColor(Color.parseColor("#E0E0E0"));
        gridPaint.setStrokeWidth(2f);

        scaleDetector = new ScaleGestureDetector(context, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            @Override
            public boolean onScale(ScaleGestureDetector detector) {
                scale *= detector.getScaleFactor();
                scale = Math.max(0.5f, Math.min(scale, 2.5f));
                invalidate();
                return true;
            }
        });
    }

    public void setWorkspace(Workspace ws) {
        this.workspace = ws;
        invalidate();
    }

    public Workspace getWorkspace() {
        return workspace;
    }

    public void setOnWorkspaceListener(OnWorkspaceListener listener) {
        this.listener = listener;
    }

    public void addBlock(BlockDef def) {
        // Place block in center of visible viewport
        float viewCenterX = (-panX + getWidth() / 2f) / scale;
        float viewCenterY = (-panY + getHeight() / 2f) / scale;

        BlockInstance block = new BlockInstance(def, viewCenterX - 80f, viewCenterY - 20f);
        workspace.addBlock(block);
        invalidate();
        if (listener != null) listener.onWorkspaceChanged();
    }

    public void zoomIn() {
        scale = Math.min(scale * 1.25f, 2.5f);
        invalidate();
    }

    public void zoomOut() {
        scale = Math.max(scale / 1.25f, 0.5f);
        invalidate();
    }

    public void resetView() {
        panX = 40f;
        panY = 40f;
        scale = 1.0f;
        invalidate();
    }

    public void deleteSelectedOrDragging() {
        if (draggingBlock != null) {
            workspace.removeBlock(draggingBlock);
            draggingBlock = null;
            invalidate();
            if (listener != null) listener.onWorkspaceChanged();
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        // Draw dot grid
        drawGrid(canvas);

        canvas.save();
        canvas.translate(panX, panY);
        canvas.scale(scale, scale);

        // Draw all blocks in workspace
        for (BlockInstance block : workspace.getAllBlocks()) {
            canvas.save();
            canvas.translate(block.x, block.y);
            renderer.drawBlock(canvas, block, block == draggingBlock);
            canvas.restore();
        }

        // Draw snap indicator if dragging near connection
        if (snapParent != null && draggingBlock != null) {
            Paint p = new Paint();
            p.setColor(Color.parseColor("#4000E676"));
            p.setStyle(Paint.Style.FILL);
            if (snapToStatement) {
                canvas.drawRect(snapParent.x + 20f, snapParent.y + 40f,
                        snapParent.x + 200f, snapParent.y + 84f, p);
            } else {
                canvas.drawRect(snapParent.x, snapParent.y + snapParent.measuredHeight,
                        snapParent.x + snapParent.measuredWidth,
                        snapParent.y + snapParent.measuredHeight + 44f, p);
            }
        }

        canvas.restore();
    }

    private void drawGrid(Canvas canvas) {
        float step = 30f * scale;
        float startX = panX % step;
        float startY = panY % step;
        for (float x = startX; x < getWidth(); x += step) {
            for (float y = startY; y < getHeight(); y += step) {
                canvas.drawPoint(x, y, gridPaint);
            }
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        scaleDetector.onTouchEvent(event);
        if (scaleDetector.isInProgress()) {
            return true;
        }

        float worldX = (event.getX() - panX) / scale;
        float worldY = (event.getY() - panY) / scale;

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                touchStartX = event.getX();
                touchStartY = event.getY();

                // Check if user tapped a block
                BlockInstance hitBlock = findBlockAt(worldX, worldY);
                if (hitBlock != null) {
                    // Check if tapped a field inside block
                    if (handleFieldClick(hitBlock, worldX - hitBlock.x, worldY - hitBlock.y)) {
                        return true;
                    }

                    // Otherwise, start dragging block
                    draggingBlock = hitBlock;
                    blockStartOffsetX = worldX - hitBlock.x;
                    blockStartOffsetY = worldY - hitBlock.y;

                    // Detach from parent when dragging starts
                    draggingBlock.detachFromParent();
                    isPanning = false;
                } else {
                    isPanning = true;
                }
                invalidate();
                return true;

            case MotionEvent.ACTION_MOVE:
                if (draggingBlock != null) {
                    draggingBlock.x = worldX - blockStartOffsetX;
                    draggingBlock.y = worldY - blockStartOffsetY;
                    draggingBlock.updateChainPositions();

                    // Detect snap candidate
                    updateSnapCandidate(draggingBlock);
                    invalidate();
                } else if (isPanning) {
                    panX += event.getX() - touchStartX;
                    panY += event.getY() - touchStartY;
                    touchStartX = event.getX();
                    touchStartY = event.getY();
                    invalidate();
                }
                return true;

            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                if (draggingBlock != null) {
                    // Apply snap if active
                    if (snapParent != null) {
                        if (snapToStatement) {
                            snapParent.statementChild = draggingBlock;
                            draggingBlock.parentStatement = snapParent;
                        } else {
                            snapParent.next = draggingBlock;
                            draggingBlock.previous = snapParent;
                        }
                        snapParent.updateChainPositions();
                        snapParent = null;
                    }
                    draggingBlock = null;
                    invalidate();
                    if (listener != null) listener.onWorkspaceChanged();
                }
                isPanning = false;
                return true;
        }

        return super.onTouchEvent(event);
    }

    private BlockInstance findBlockAt(float wx, float wy) {
        List<BlockInstance> list = workspace.getAllBlocks();
        for (int i = list.size() - 1; i >= 0; i--) {
            BlockInstance b = list.get(i);
            if (b.getBounds().contains(wx, wy)) {
                return b;
            }
        }
        return null;
    }

    private boolean handleFieldClick(BlockInstance block, float localX, float localY) {
        BlockRenderer.MeasureResult m = renderer.measure(block);
        for (BlockRenderer.FieldLayout fl : m.fields) {
            if (fl.bounds.contains(localX, localY)) {
                showFieldEditorDialog(block, fl.def);
                return true;
            }
        }
        return false;
    }

    private void showFieldEditorDialog(BlockInstance block, FieldDef def) {
        if (def.getType().equals("dropdown")) {
            final List<String> opts = def.getOptions();
            String[] arr = opts.toArray(new String[0]);
            new AlertDialog.Builder(getContext())
                    .setTitle("Select " + def.getName())
                    .setItems(arr, (dialog, which) -> {
                        block.setFieldValue(def.getName(), opts.get(which));
                        invalidate();
                        if (listener != null) listener.onWorkspaceChanged();
                    })
                    .show();
        } else if (def.getType().equals("number")) {
            final EditText input = new EditText(getContext());
            input.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED);
            input.setText(block.getFieldValue(def.getName()));

            new AlertDialog.Builder(getContext())
                    .setTitle("Set " + def.getName())
                    .setView(input)
                    .setPositiveButton("OK", (dialog, which) -> {
                        String val = input.getText().toString().trim();
                        block.setFieldValue(def.getName(), val.isEmpty() ? "0" : val);
                        invalidate();
                        if (listener != null) listener.onWorkspaceChanged();
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        } else {
            final EditText input = new EditText(getContext());
            input.setText(block.getFieldValue(def.getName()));

            new AlertDialog.Builder(getContext())
                    .setTitle("Set " + def.getName())
                    .setView(input)
                    .setPositiveButton("OK", (dialog, which) -> {
                        block.setFieldValue(def.getName(), input.getText().toString());
                        invalidate();
                        if (listener != null) listener.onWorkspaceChanged();
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
        }
    }

    private void updateSnapCandidate(BlockInstance dragging) {
        snapParent = null;
        snapToStatement = false;

        float snapThreshold = 35f;

        for (BlockInstance other : workspace.getAllBlocks()) {
            if (other == dragging || isDescendant(dragging, other)) continue;

            // Check next connection (other's bottom to dragging's top)
            if (other.next == null && other.getDef().hasNextStatement() && dragging.getDef().hasPreviousStatement()) {
                float targetX = other.x;
                float targetY = other.y + other.measuredHeight;
                float dist = (float) Math.hypot(dragging.x - targetX, dragging.y - targetY);
                if (dist < snapThreshold) {
                    snapParent = other;
                    snapToStatement = false;
                    return;
                }
            }

            // Check statement slot (inside other loop/if)
            if (other.getDef().hasStatements() && other.statementChild == null && dragging.getDef().hasPreviousStatement()) {
                float targetX = other.x + 20f;
                float targetY = other.y + 40f;
                float dist = (float) Math.hypot(dragging.x - targetX, dragging.y - targetY);
                if (dist < snapThreshold) {
                    snapParent = other;
                    snapToStatement = true;
                    return;
                }
            }
        }
    }

    private boolean isDescendant(BlockInstance parent, BlockInstance target) {
        BlockInstance cur = parent.next;
        while (cur != null) {
            if (cur == target) return true;
            if (cur.statementChild != null && isDescendant(cur.statementChild, target)) return true;
            cur = cur.next;
        }
        if (parent.statementChild != null) {
            if (parent.statementChild == target) return true;
            if (isDescendant(parent.statementChild, target)) return true;
        }
        return false;
    }
}
