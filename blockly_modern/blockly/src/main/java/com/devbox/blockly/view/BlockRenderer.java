package com.devbox.blockly.view;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockInstance;
import com.devbox.blockly.model.FieldDef;

import java.util.ArrayList;
import java.util.List;

public class BlockRenderer {

    public static final float NOTCH_WIDTH = 20f;
    public static final float NOTCH_HEIGHT = 8f;
    public static final float NOTCH_START_X = 16f;
    public static final float CORNER_RADIUS = 6f;
    public static final float HEADER_HEIGHT = 44f;
    public static final float STATEMENT_BAR_HEIGHT = 20f;
    public static final float STATEMENT_INSET = 20f;

    public static class FieldLayout {
        public final FieldDef def;
        public final RectF bounds;
        public final String displayText;

        public FieldLayout(FieldDef def, RectF bounds, String displayText) {
            this.def = def;
            this.bounds = bounds;
            this.displayText = displayText;
        }
    }

    public static class MeasureResult {
        public float width;
        public float height;
        public List<FieldLayout> fields = new ArrayList<>();
    }

    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint highlightPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint fieldBgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint fieldTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    public BlockRenderer() {
        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeWidth(2f);

        highlightPaint.setStyle(Paint.Style.STROKE);
        highlightPaint.setStrokeWidth(4f);
        highlightPaint.setColor(Color.parseColor("#FFEB3B"));

        textPaint.setColor(Color.WHITE);
        textPaint.setTextSize(14f);
        textPaint.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));

        fieldBgPaint.setColor(Color.WHITE);
        fieldBgPaint.setStyle(Paint.Style.FILL);

        fieldTextPaint.setColor(Color.parseColor("#212121"));
        fieldTextPaint.setTextSize(13f);
        fieldTextPaint.setTypeface(Typeface.DEFAULT);
    }

    public MeasureResult measure(BlockInstance block) {
        MeasureResult res = new MeasureResult();
        BlockDef def = block.getDef();

        float xCursor = 16f;
        String msg = def.getMessage();

        // Tokenize message by %1, %2, etc.
        String[] tokens = msg.split("(?=%[0-9]+)|(?<=%[0-9]+)");
        int fieldIndex = 0;

        for (String token : tokens) {
            if (token.startsWith("%") && token.length() >= 2 && Character.isDigit(token.charAt(1))) {
                if (fieldIndex < def.getFields().size()) {
                    FieldDef f = def.getFields().get(fieldIndex);
                    String val = block.getFieldValue(f.getName());
                    String display = val.isEmpty() ? f.getDefaultValue() : val;
                    if (f.getType().equals("dropdown")) {
                        display = display + " \u25BC";
                    }

                    float fieldTextW = fieldTextPaint.measureText(display);
                    float pillW = fieldTextW + 16f;
                    RectF bounds = new RectF(xCursor, 10f, xCursor + pillW, 34f);
                    res.fields.add(new FieldLayout(f, bounds, display));
                    xCursor += pillW + 8f;
                    fieldIndex++;
                }
            } else if (!token.trim().isEmpty()) {
                float textW = textPaint.measureText(token.trim());
                xCursor += textW + 8f;
            }
        }

        res.width = Math.max(xCursor + 16f, 160f);

        if (def.hasStatements()) {
            float innerHeight = 40f;
            if (block.statementChild != null) {
                innerHeight = measureChainHeight(block.statementChild);
            }
            res.height = HEADER_HEIGHT + innerHeight + STATEMENT_BAR_HEIGHT;
            block.statementGapHeight = innerHeight;
        } else {
            res.height = HEADER_HEIGHT;
        }

        block.measuredWidth = res.width;
        block.measuredHeight = res.height;
        return res;
    }

    private float measureChainHeight(BlockInstance head) {
        float h = 0;
        BlockInstance cur = head;
        while (cur != null) {
            measure(cur);
            h += cur.measuredHeight;
            cur = cur.next;
        }
        return Math.max(h, 40f);
    }

    public void drawBlock(Canvas canvas, BlockInstance block, boolean isHighlighted) {
        MeasureResult layout = measure(block);
        BlockDef def = block.getDef();

        fillPaint.setColor(def.getColor());
        strokePaint.setColor(darkenColor(def.getColor(), 0.8f));

        Path path = createBlockPath(block, layout.width, layout.height, block.statementGapHeight);

        // Fill & Stroke
        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);

        if (isHighlighted) {
            canvas.drawPath(path, highlightPaint);
        }

        // Draw Labels & Fields
        drawContents(canvas, block, layout);
    }

    private Path createBlockPath(BlockInstance block, float w, float h, float statementGap) {
        Path p = new Path();
        BlockDef def = block.getDef();

        // 1. Top edge: top-left corner
        p.moveTo(0, CORNER_RADIUS);
        p.quadTo(0, 0, CORNER_RADIUS, 0);

        // Top notch (if previousStatement)
        if (def.hasPreviousStatement()) {
            p.lineTo(NOTCH_START_X, 0);
            p.lineTo(NOTCH_START_X + 4f, NOTCH_HEIGHT);
            p.lineTo(NOTCH_START_X + NOTCH_WIDTH - 4f, NOTCH_HEIGHT);
            p.lineTo(NOTCH_START_X + NOTCH_WIDTH, 0);
        }
        p.lineTo(w - CORNER_RADIUS, 0);
        p.quadTo(w, 0, w, CORNER_RADIUS);

        if (def.hasStatements()) {
            // Header right edge
            p.lineTo(w, HEADER_HEIGHT - CORNER_RADIUS);
            p.quadTo(w, HEADER_HEIGHT, w - CORNER_RADIUS, HEADER_HEIGHT);

            // Statement mouth top inner edge
            p.lineTo(STATEMENT_INSET + NOTCH_START_X + NOTCH_WIDTH, HEADER_HEIGHT);
            // Statement child top notch (pointing down into mouth)
            p.lineTo(STATEMENT_INSET + NOTCH_START_X + NOTCH_WIDTH - 4f, HEADER_HEIGHT + NOTCH_HEIGHT);
            p.lineTo(STATEMENT_INSET + NOTCH_START_X + 4f, HEADER_HEIGHT + NOTCH_HEIGHT);
            p.lineTo(STATEMENT_INSET + NOTCH_START_X, HEADER_HEIGHT);
            p.lineTo(STATEMENT_INSET, HEADER_HEIGHT);

            // Left spine of statement mouth
            float bottomBarTop = HEADER_HEIGHT + statementGap;
            p.lineTo(STATEMENT_INSET, bottomBarTop);

            // Bottom bar inner top edge
            p.lineTo(w - CORNER_RADIUS, bottomBarTop);
            p.quadTo(w, bottomBarTop, w, bottomBarTop + CORNER_RADIUS);

            // Bottom bar right edge
            p.lineTo(w, h - CORNER_RADIUS);
            p.quadTo(w, h, w - CORNER_RADIUS, h);
        } else {
            // Simple block right edge
            p.lineTo(w, h - CORNER_RADIUS);
            p.quadTo(w, h, w - CORNER_RADIUS, h);
        }

        // Bottom edge with bottom notch
        if (def.hasNextStatement()) {
            p.lineTo(NOTCH_START_X + NOTCH_WIDTH, h);
            p.lineTo(NOTCH_START_X + NOTCH_WIDTH - 4f, h + NOTCH_HEIGHT);
            p.lineTo(NOTCH_START_X + 4f, h + NOTCH_HEIGHT);
            p.lineTo(NOTCH_START_X, h);
        }
        p.lineTo(CORNER_RADIUS, h);
        p.quadTo(0, h, 0, h - CORNER_RADIUS);

        p.close();
        return p;
    }

    private void drawContents(Canvas canvas, BlockInstance block, MeasureResult layout) {
        BlockDef def = block.getDef();
        String msg = def.getMessage();
        String[] tokens = msg.split("(?=%[0-9]+)|(?<=%[0-9]+)");

        float xCursor = 16f;
        int fieldIndex = 0;

        for (String token : tokens) {
            if (token.startsWith("%") && token.length() >= 2 && Character.isDigit(token.charAt(1))) {
                if (fieldIndex < layout.fields.size()) {
                    FieldLayout fl = layout.fields.get(fieldIndex);
                    // Draw field pill
                    canvas.drawRoundRect(fl.bounds, 6f, 6f, fieldBgPaint);
                    // Draw field text inside pill
                    float textY = fl.bounds.centerY() + 5f;
                    canvas.drawText(fl.displayText, fl.bounds.left + 8f, textY, fieldTextPaint);
                    xCursor = fl.bounds.right + 8f;
                    fieldIndex++;
                }
            } else if (!token.trim().isEmpty()) {
                float textY = 27f;
                canvas.drawText(token.trim(), xCursor, textY, textPaint);
                xCursor += textPaint.measureText(token.trim()) + 8f;
            }
        }
    }

    private int darkenColor(int color, float factor) {
        int a = Color.alpha(color);
        int r = Math.round(Color.red(color) * factor);
        int g = Math.round(Color.green(color) * factor);
        int b = Math.round(Color.blue(color) * factor);
        return Color.argb(a, Math.min(r, 255), Math.min(g, 255), Math.min(b, 255));
    }
}
