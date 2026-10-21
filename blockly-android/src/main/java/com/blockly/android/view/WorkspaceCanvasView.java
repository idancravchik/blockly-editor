package com.blockly.android.view;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.widget.EditText;
import com.blockly.android.model.BlockDef;
import com.blockly.android.model.BlockInstance;
import com.blockly.android.model.FieldDef;
import com.blockly.android.model.Workspace;

import java.util.List;

public class WorkspaceCanvasView extends View {

    public interface OnWorkspaceListener {
        void onWorkspaceChanged();
        void onBlockSelected(BlockInstance block);
    }

    private Workspace workspace = new Workspace();
    private final BlockRenderer renderer = new BlockRenderer();

    private float panX = 40f;
    private float panY = 40f;
    private float scale = 1.0f;
    private ScaleGestureDetector scaleDetector;

    private BlockInstance draggingBlock = null;
    private float touchStartX, touchStartY;
    private float blockStartOffsetX, blockStartOffsetY;
    private boolean isPanning = false;

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

    public WorkspaceCanvasView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    public WorkspaceCanvasView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(context);
    }

    private void init(Context context) {
        gridPaint.setColor(Color.parseColor("#C8D1D9"));
        gridPaint.setStrokeWidth(3f);

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

        // Always paint light background regardless of system theme
        canvas.drawColor(Color.parseColor("#F5F5F5"));

        drawGrid(canvas);

        canvas.save();
        canvas.translate(panX, panY);
        canvas.scale(scale, scale);

        for (BlockInstance block : workspace.getAllBlocks()) {
            canvas.save();
            canvas.translate(block.x, block.y);
            renderer.drawBlock(canvas, block, block == draggingBlock);
            canvas.restore();
        }

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
        float step = Math.max(12f, 30f * scale);
        float startX = panX % step;
        if (startX < 0) startX += step;
        float startY = panY % step;
        if (startY < 0) startY += step;

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

                BlockInstance hitBlock = findBlockAt(worldX, worldY);
                if (hitBlock != null) {
                    if (handleFieldClick(hitBlock, worldX - hitBlock.x, worldY - hitBlock.y)) {
                        return true;
                    }

                    draggingBlock = hitBlock;
                    blockStartOffsetX = worldX - hitBlock.x;
                    blockStartOffsetY = worldY - hitBlock.y;
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
