package com.blockly.android.model;

import android.graphics.RectF;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class BlockInstance {
    private final String id;
    private final BlockDef def;
    private final Map<String, String> fieldValues = new HashMap<>();

    public float x;
    public float y;

    public BlockInstance previous;
    public BlockInstance next;
    public BlockInstance parentStatement;
    public BlockInstance statementChild;

    public float measuredWidth = 200f;
    public float measuredHeight = 44f;
    public float statementGapHeight = 40f;

    public BlockInstance(BlockDef def, float x, float y) {
        this(UUID.randomUUID().toString(), def, x, y);
    }

    public BlockInstance(String id, BlockDef def, float x, float y) {
        this.id = id != null ? id : UUID.randomUUID().toString();
        this.def = def;
        this.x = x;
        this.y = y;

        if (def != null) {
            for (FieldDef field : def.getFields()) {
                fieldValues.put(field.getName(), field.getDefaultValue());
            }
        }
    }

    public String getId() { return id; }
    public BlockDef getDef() { return def; }
    public Map<String, String> getFieldValues() { return fieldValues; }

    public String getFieldValue(String name) {
        String val = fieldValues.get(name);
        if (val == null && def != null) {
            FieldDef f = def.getField(name);
            return f != null ? f.getDefaultValue() : "";
        }
        return val != null ? val : "";
    }

    public void setFieldValue(String name, String value) {
        fieldValues.put(name, value);
    }

    public RectF getBounds() {
        return new RectF(x, y, x + measuredWidth, y + measuredHeight);
    }

    public RectF getTopConnectorBounds() {
        return new RectF(x + 16f, y - 12f, x + 36f, y + 12f);
    }

    public RectF getBottomConnectorBounds() {
        return new RectF(x + 16f, y + measuredHeight - 12f, x + 36f, y + measuredHeight + 12f);
    }

    public RectF getStatementConnectorBounds() {
        if (def == null || !def.hasStatements()) return null;
        return new RectF(x + 36f, y + 30f, x + 56f, y + 54f);
    }

    public void updateChainPositions() {
        if (statementChild != null) {
            statementChild.x = this.x + 20f;
            statementChild.y = this.y + 40f;
            statementChild.updateChainPositions();
        }
        if (next != null) {
            next.x = this.x;
            next.y = this.y + this.measuredHeight;
            next.updateChainPositions();
        }
    }

    public void detachFromParent() {
        if (previous != null) {
            previous.next = null;
            previous = null;
        }
        if (parentStatement != null) {
            if (parentStatement.statementChild == this) {
                parentStatement.statementChild = null;
            }
            parentStatement = null;
        }
    }
}
