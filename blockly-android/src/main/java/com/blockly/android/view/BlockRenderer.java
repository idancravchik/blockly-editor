package com.blockly.android.view;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import com.blockly.android.model.BlockDef;
import com.blockly.android.model.BlockInstance;
import com.blockly.android.model.FieldDef;

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

        fieldTextPaint.setColor(Color.DKGRAY);
        fieldTextPaint.setTextSize(13f);
    }

    public MeasureResult measure(BlockInstance block) {
        BlockDef def = block.getDef();
        MeasureResult res = new MeasureResult();

        float curX = 16f;
        String message = def.getMessage();

        float textWidth = textPaint.measureText(message);
        curX += textWidth + 8f;

        for (FieldDef f : def.getFields()) {
            String val = block.getFieldValue(f.getName());
            if (val.isEmpty()) val = f.getDefaultValue();
            String display = "[" + f.getName() + ": " + val + "]";
            float fWidth = fieldTextPaint.measureText(display) + 16f;
            float fHeight = 24f;
            float fTop = (HEADER_HEIGHT - fHeight) / 2f;

            RectF bounds = new RectF(curX, fTop, curX + fWidth, fTop + fHeight);
            res.fields.add(new FieldLayout(f, bounds, display));
            curX += fWidth + 8f;
        }

        res.width = Math.max(160f, curX + 16f);

        if (def.hasStatements()) {
            float innerHeight = 40f;
            BlockInstance child = block.statementChild;
            while (child != null) {
                innerHeight += child.measuredHeight;
                child = child.next;
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

    public void drawBlock(Canvas canvas, BlockInstance block, boolean isSelected) {
        MeasureResult m = measure(block);
        BlockDef def = block.getDef();

        fillPaint.setColor(def.getColor());
        strokePaint.setColor(darkenColor(def.getColor()));

        Path path = buildBlockPath(block, m.width, m.height);

        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, isSelected ? highlightPaint : strokePaint);

        canvas.drawText(def.getMessage(), 16f, 27f, textPaint);

        for (FieldLayout fl : m.fields) {
            canvas.drawRoundRect(fl.bounds, 4f, 4f, fieldBgPaint);
            canvas.drawRoundRect(fl.bounds, 4f, 4f, strokePaint);
            canvas.drawText(fl.displayText, fl.bounds.left + 8f, fl.bounds.top + 17f, fieldTextPaint);
        }
    }

    private Path buildBlockPath(BlockInstance block, float w, float h) {
        BlockDef def = block.getDef();
        Path p = new Path();

        p.moveTo(0, CORNER_RADIUS);
        p.quadTo(0, 0, CORNER_RADIUS, 0);

        if (def.hasPreviousStatement()) {
            p.lineTo(NOTCH_START_X, 0);
            p.lineTo(NOTCH_START_X + 4f, NOTCH_HEIGHT);
            p.lineTo(NOTCH_START_X + NOTCH_WIDTH - 4f, NOTCH_HEIGHT);
            p.lineTo(NOTCH_START_X + NOTCH_WIDTH, 0);
        }
        p.lineTo(w - CORNER_RADIUS, 0);
        p.quadTo(w, 0, w, CORNER_RADIUS);

        if (!def.hasStatements()) {
            p.lineTo(w, h - CORNER_RADIUS);
            p.quadTo(w, h, w - CORNER_RADIUS, h);

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

        p.lineTo(w, HEADER_HEIGHT - CORNER_RADIUS);
        p.quadTo(w, HEADER_HEIGHT, w - CORNER_RADIUS, HEADER_HEIGHT);

        float innerTop = HEADER_HEIGHT;
        float innerLeft = STATEMENT_INSET;
        float innerBottom = HEADER_HEIGHT + block.statementGapHeight;

        p.lineTo(innerLeft + NOTCH_START_X + NOTCH_WIDTH, innerTop);
        p.lineTo(innerLeft + NOTCH_START_X + NOTCH_WIDTH - 4f, innerTop + NOTCH_HEIGHT);
        p.lineTo(innerLeft + NOTCH_START_X + 4f, innerTop + NOTCH_HEIGHT);
        p.lineTo(innerLeft + NOTCH_START_X, innerTop);
        p.lineTo(innerLeft + CORNER_RADIUS, innerTop);
        p.quadTo(innerLeft, innerTop, innerLeft, innerTop + CORNER_RADIUS);

        p.lineTo(innerLeft, innerBottom - CORNER_RADIUS);
        p.quadTo(innerLeft, innerBottom, innerLeft + CORNER_RADIUS, innerBottom);

        p.lineTo(innerLeft + NOTCH_START_X, innerBottom);
        p.lineTo(innerLeft + NOTCH_START_X + 4f, innerBottom + NOTCH_HEIGHT);
        p.lineTo(innerLeft + NOTCH_START_X + NOTCH_WIDTH - 4f, innerBottom + NOTCH_HEIGHT);
        p.lineTo(innerLeft + NOTCH_START_X + NOTCH_WIDTH, innerBottom);

        p.lineTo(w - CORNER_RADIUS, innerBottom);
        p.quadTo(w, innerBottom, w, innerBottom + CORNER_RADIUS);

        p.lineTo(w, h - CORNER_RADIUS);
        p.quadTo(w, h, w - CORNER_RADIUS, h);

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

    private int darkenColor(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color, hsv);
        hsv[2] *= 0.8f;
        return Color.HSVToColor(hsv);
    }
}
