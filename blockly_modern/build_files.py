import os

base_dir = "blockly_modern"

def write(rel_path, content):
    full_path = os.path.join(base_dir, rel_path)
    os.makedirs(os.path.dirname(full_path), exist_ok=True)
    with open(full_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("Wrote:", rel_path)

# ==============================================================================
# 1. MODEL CLASSES
# ==============================================================================

write("blockly/src/main/java/com/devbox/blockly/model/FieldDef.java", """package com.devbox.blockly.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FieldDef {
    private final String name;
    private final String type;
    private final String defaultValue;
    private final List<String> options;

    public FieldDef(String name, String type, String defaultValue, List<String> options) {
        this.name = name;
        this.type = type != null ? type.toLowerCase() : "text";
        this.defaultValue = defaultValue != null ? defaultValue : "";
        this.options = options != null ? options : new ArrayList<>();
    }

    public String getName() { return name; }
    public String getType() { return type; }
    public String getDefaultValue() { return defaultValue; }
    public List<String> getOptions() { return Collections.unmodifiableList(options); }
}
""")

write("blockly/src/main/java/com/devbox/blockly/model/BlockDef.java", """package com.devbox.blockly.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BlockDef {
    private final String type;
    private final String message;
    private final int color;
    private final List<FieldDef> fields;
    private final boolean hasStatements;
    private final String statementName;
    private final boolean previousStatement;
    private final boolean nextStatement;
    private final String codeTemplate;

    public BlockDef(String type, String message, int color, List<FieldDef> fields,
                    boolean hasStatements, String statementName,
                    boolean previousStatement, boolean nextStatement, String codeTemplate) {
        this.type = type;
        this.message = message != null ? message : type;
        this.color = color;
        this.fields = fields != null ? fields : new ArrayList<>();
        this.hasStatements = hasStatements;
        this.statementName = statementName != null ? statementName : "DO";
        this.previousStatement = previousStatement;
        this.nextStatement = nextStatement;
        this.codeTemplate = codeTemplate != null ? codeTemplate : "";
    }

    public String getType() { return type; }
    public String getMessage() { return message; }
    public int getColor() { return color; }
    public List<FieldDef> getFields() { return Collections.unmodifiableList(fields); }
    public boolean hasStatements() { return hasStatements; }
    public String getStatementName() { return statementName; }
    public boolean hasPreviousStatement() { return previousStatement; }
    public boolean hasNextStatement() { return nextStatement; }
    public String getCodeTemplate() { return codeTemplate; }

    public FieldDef getField(String name) {
        for (FieldDef f : fields) {
            if (f.getName().equals(name)) return f;
        }
        return null;
    }
}
""")

write("blockly/src/main/java/com/devbox/blockly/model/CategoryDef.java", """package com.devbox.blockly.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CategoryDef {
    private final String id;
    private final String name;
    private final int color;
    private final List<String> blockTypes;

    public CategoryDef(String id, String name, int color, List<String> blockTypes) {
        this.id = id;
        this.name = name != null ? name : id;
        this.color = color;
        this.blockTypes = blockTypes != null ? blockTypes : new ArrayList<>();
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public int getColor() { return color; }
    public List<String> getBlockTypes() { return Collections.unmodifiableList(blockTypes); }
}
""")

write("blockly/src/main/java/com/devbox/blockly/model/BlockInstance.java", """package com.devbox.blockly.model;

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
        this.id = UUID.randomUUID().toString();
        this.def = def;
        this.x = x;
        this.y = y;

        for (FieldDef field : def.getFields()) {
            fieldValues.put(field.getName(), field.getDefaultValue());
        }
    }

    public String getId() { return id; }
    public BlockDef getDef() { return def; }
    public Map<String, String> getFieldValues() { return fieldValues; }

    public String getFieldValue(String name) {
        String val = fieldValues.get(name);
        if (val == null) {
            FieldDef f = def.getField(name);
            return f != null ? f.getDefaultValue() : "";
        }
        return val;
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
        if (!def.hasStatements()) return null;
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
""")

write("blockly/src/main/java/com/devbox/blockly/model/Workspace.java", """package com.devbox.blockly.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Workspace {
    private final List<BlockInstance> blocks = new ArrayList<>();

    public void addBlock(BlockInstance block) {
        if (!blocks.contains(block)) {
            blocks.add(block);
        }
    }

    public void removeBlock(BlockInstance block) {
        block.detachFromParent();
        if (block.next != null) {
            block.next.previous = null;
            block.next = null;
        }
        if (block.statementChild != null) {
            block.statementChild.parentStatement = null;
            block.statementChild = null;
        }
        blocks.remove(block);
    }

    public void clear() {
        blocks.clear();
    }

    public List<BlockInstance> getAllBlocks() {
        return Collections.unmodifiableList(blocks);
    }

    public List<BlockInstance> getRootBlocks() {
        List<BlockInstance> roots = new ArrayList<>();
        for (BlockInstance b : blocks) {
            if (b.previous == null && b.parentStatement == null) {
                roots.add(b);
            }
        }
        return roots;
    }
}
""")

write("blockly/src/main/java/com/devbox/blockly/model/BlockSpecParser.java", """package com.devbox.blockly.model;

import android.graphics.Color;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class BlockSpecParser {

    public static List<BlockDef> parseBlocks(String jsonString) throws JSONException {
        List<BlockDef> list = new ArrayList<>();
        JSONArray arr = new JSONArray(jsonString);
        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.getJSONObject(i);
            String type = obj.getString("type");
            String message = obj.optString("message", type);

            int color = Color.parseColor("#4CAF50");
            if (obj.has("color")) {
                try {
                    color = Color.parseColor(obj.getString("color"));
                } catch (Exception ignored) {}
            }

            List<FieldDef> fields = new ArrayList<>();
            if (obj.has("fields")) {
                JSONArray fieldsArr = obj.getJSONArray("fields");
                for (int j = 0; j < fieldsArr.length(); j++) {
                    JSONObject fObj = fieldsArr.getJSONObject(j);
                    String fName = fObj.getString("name");
                    String fType = fObj.optString("type", "text");
                    String fDefault = fObj.optString("default", "");
                    List<String> options = new ArrayList<>();
                    if (fObj.has("options")) {
                        JSONArray optArr = fObj.getJSONArray("options");
                        for (int k = 0; k < optArr.length(); k++) {
                            options.add(optArr.getString(k));
                        }
                    }
                    fields.add(new FieldDef(fName, fType, fDefault, options));
                }
            }

            boolean hasStatements = false;
            String statementName = "DO";
            if (obj.has("statements")) {
                JSONArray stmts = obj.getJSONArray("statements");
                if (stmts.length() > 0) {
                    hasStatements = true;
                    statementName = stmts.getJSONObject(0).optString("name", "DO");
                }
            }

            boolean previousStatement = obj.optBoolean("previousStatement", true);
            boolean nextStatement = obj.optBoolean("nextStatement", true);
            String code = obj.optString("code", "");

            list.add(new BlockDef(type, message, color, fields, hasStatements,
                    statementName, previousStatement, nextStatement, code));
        }
        return list;
    }

    public static List<CategoryDef> parseCategories(String jsonString) throws JSONException {
        List<CategoryDef> list = new ArrayList<>();
        JSONArray arr = new JSONArray(jsonString);
        for (int i = 0; i < arr.length(); i++) {
            JSONObject obj = arr.getJSONObject(i);
            String id = obj.getString("id");
            String name = obj.optString("name", id);
            int color = Color.parseColor("#607D8B");
            if (obj.has("color")) {
                try {
                    color = Color.parseColor(obj.getString("color"));
                } catch (Exception ignored) {}
            }
            List<String> blockTypes = new ArrayList<>();
            if (obj.has("blocks")) {
                JSONArray bArr = obj.getJSONArray("blocks");
                for (int k = 0; k < bArr.length(); k++) {
                    blockTypes.add(bArr.getString(k));
                }
            }
            list.add(new CategoryDef(id, name, color, blockTypes));
        }
        return list;
    }
}
""")

# ==============================================================================
# 2. CODE GENERATOR
# ==============================================================================

write("blockly/src/main/java/com/devbox/blockly/codegen/CodeGenerator.java", """package com.devbox.blockly.codegen;

import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockInstance;
import com.devbox.blockly.model.Workspace;

import java.util.HashMap;
import java.util.Map;

public class CodeGenerator {

    @FunctionalInterface
    public interface CustomBlockGenerator {
        String generate(BlockInstance block, Map<String, String> values);
    }

    private final Map<String, CustomBlockGenerator> customGenerators = new HashMap<>();

    public void registerGenerator(String blockType, CustomBlockGenerator generator) {
        customGenerators.put(blockType, generator);
    }

    public String generate(Workspace workspace) {
        StringBuilder sb = new StringBuilder();
        for (BlockInstance root : workspace.getRootBlocks()) {
            generateChain(root, sb, 0);
        }
        return sb.toString();
    }

    private void generateChain(BlockInstance block, StringBuilder sb, int indentLevel) {
        BlockInstance current = block;
        while (current != null) {
            String blockCode = generateSingleBlock(current, indentLevel);
            sb.append(blockCode);
            current = current.next;
        }
    }

    private String generateSingleBlock(BlockInstance block, int indentLevel) {
        BlockDef def = block.getDef();
        String indent = "  ".repeat(indentLevel);

        if (customGenerators.containsKey(def.getType())) {
            String custom = customGenerators.get(def.getType()).generate(block, block.getFieldValues());
            return prefixLines(custom, indent);
        }

        String template = def.getCodeTemplate();
        if (template.isEmpty()) {
            return indent + "// [Block: " + def.getType() + "]\\n";
        }

        for (Map.Entry<String, String> entry : block.getFieldValues().entrySet()) {
            template = template.replace("%" + entry.getKey() + "%", entry.getValue());
        }

        if (def.hasStatements()) {
            StringBuilder stmtCode = new StringBuilder();
            if (block.statementChild != null) {
                generateChain(block.statementChild, stmtCode, indentLevel + 1);
            }
            template = template.replace("%" + def.getStatementName() + "%", stmtCode.toString());
        }

        return prefixLines(template, indent);
    }

    private String prefixLines(String text, String prefix) {
        if (prefix.isEmpty() || text.isEmpty()) return text;
        String[] lines = text.split("\\n", -1);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < lines.length; i++) {
            if (i == lines.length - 1 && lines[i].isEmpty()) {
                sb.append("\\n");
                break;
            }
            sb.append(prefix).append(lines[i]).append("\\n");
        }
        return sb.toString();
    }
}
""")

# ==============================================================================
# 3. RENDERING & UI (BlockRenderer, WorkspaceCanvasView, BlocklyView)
# ==============================================================================

write("blockly/src/main/java/com/devbox/blockly/view/BlockRenderer.java", """package com.devbox.blockly.view;

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
                        display = display + " \\u25BC";
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
""")

write("blockly/src/main/java/com/devbox/blockly/view/WorkspaceCanvasView.java", """package com.devbox.blockly.view;

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
""")

write("blockly/src/main/java/com/devbox/blockly/BlocklyView.java", """package com.devbox.blockly;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import com.devbox.blockly.codegen.CodeGenerator;
import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockSpecParser;
import com.devbox.blockly.model.CategoryDef;
import com.devbox.blockly.model.Workspace;
import com.devbox.blockly.view.WorkspaceCanvasView;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlocklyView extends FrameLayout {

    public interface OnWorkspaceChangedListener {
        void onWorkspaceChanged();
    }

    private WorkspaceCanvasView canvasView;
    private LinearLayout categoryChipsLayout;
    private LinearLayout toolboxPalette;
    private TextView activeCategoryTitle;

    private final List<BlockDef> blockDefs = new ArrayList<>();
    private final List<CategoryDef> categories = new ArrayList<>();
    private final Map<String, BlockDef> blockMap = new HashMap<>();
    private final CodeGenerator codeGenerator = new CodeGenerator();
    private OnWorkspaceChangedListener workspaceChangedListener;

    public BlocklyView(Context context) {
        super(context);
        init(context);
    }

    public BlocklyView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    private void init(Context context) {
        LayoutInflater.from(context).inflate(R.layout.view_blockly, this, true);

        canvasView = findViewById(R.id.workspaceCanvas);
        categoryChipsLayout = findViewById(R.id.categoryChips);
        toolboxPalette = findViewById(R.id.toolboxPalette);
        activeCategoryTitle = findViewById(R.id.activeCategoryTitle);

        canvasView.setOnWorkspaceListener(new WorkspaceCanvasView.OnWorkspaceListener() {
            @Override
            public void onWorkspaceChanged() {
                if (workspaceChangedListener != null) {
                    workspaceChangedListener.onWorkspaceChanged();
                }
            }

            @Override
            public void onBlockSelected(com.devbox.blockly.model.BlockInstance block) {}
        });

        // Zoom & Reset buttons
        findViewById(R.id.btnZoomIn).setOnClickListener(v -> canvasView.zoomIn());
        findViewById(R.id.btnZoomOut).setOnClickListener(v -> canvasView.zoomOut());
        findViewById(R.id.btnResetView).setOnClickListener(v -> canvasView.resetView());
        findViewById(R.id.btnClear).setOnClickListener(v -> clearWorkspace());
    }

    public void initFromAssets(String blocksAsset, String categoriesAsset) {
        try {
            String blocksJson = loadAssetString(blocksAsset);
            String catsJson = loadAssetString(categoriesAsset);
            initFromStrings(blocksJson, catsJson);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void initFromStrings(String blocksJson, String categoriesJson) {
        try {
            blockDefs.clear();
            blockMap.clear();
            categories.clear();

            blockDefs.addAll(BlockSpecParser.parseBlocks(blocksJson));
            for (BlockDef b : blockDefs) {
                blockMap.put(b.getType(), b);
            }

            categories.addAll(BlockSpecParser.parseCategories(categoriesJson));
            buildToolboxUI();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void buildToolboxUI() {
        categoryChipsLayout.removeAllViews();
        for (CategoryDef cat : categories) {
            Button chip = new Button(getContext());
            chip.setText(cat.getName());
            chip.setTextColor(Color.WHITE);
            chip.setBackgroundColor(cat.getColor());
            chip.setTextSize(12f);
            chip.setPadding(24, 8, 24, 8);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.setMargins(8, 0, 8, 0);
            chip.setLayoutParams(lp);

            chip.setOnClickListener(v -> showCategoryBlocks(cat));
            categoryChipsLayout.addView(chip);
        }

        if (!categories.isEmpty()) {
            showCategoryBlocks(categories.get(0));
        }
    }

    private void showCategoryBlocks(CategoryDef cat) {
        activeCategoryTitle.setText(cat.getName() + " Blocks");
        activeCategoryTitle.setTextColor(cat.getColor());
        toolboxPalette.removeAllViews();

        for (String blockType : cat.getBlockTypes()) {
            BlockDef def = blockMap.get(blockType);
            if (def == null) continue;

            Button blockBtn = new Button(getContext());
            blockBtn.setText("+ " + def.getMessage().replaceAll("%[0-9]+", "..."));
            blockBtn.setBackgroundColor(def.getColor());
            blockBtn.setTextColor(Color.WHITE);
            blockBtn.setTextSize(12f);
            blockBtn.setPadding(20, 10, 20, 10);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.setMargins(0, 8, 0, 8);
            blockBtn.setLayoutParams(lp);

            blockBtn.setOnClickListener(v -> {
                canvasView.addBlock(def);
            });

            toolboxPalette.addView(blockBtn);
        }
    }

    public String generateCode() {
        return codeGenerator.generate(canvasView.getWorkspace());
    }

    public void clearWorkspace() {
        canvasView.getWorkspace().clear();
        canvasView.invalidate();
        if (workspaceChangedListener != null) workspaceChangedListener.onWorkspaceChanged();
    }

    public void setOnWorkspaceChangedListener(OnWorkspaceChangedListener listener) {
        this.workspaceChangedListener = listener;
    }

    private String loadAssetString(String filename) throws Exception {
        InputStream is = getContext().getAssets().open(filename);
        byte[] bytes = new byte[is.available()];
        is.read(bytes);
        is.close();
        return new String(bytes, StandardCharsets.UTF_8);
    }
}
""")

# ==============================================================================
# 4. RESOURCES (view_blockly.xml, colors, dimens, styles)
# ==============================================================================

write("blockly/src/main/res/layout/view_blockly.xml", """<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Workspace Canvas (Main Background) -->
    <com.devbox.blockly.view.WorkspaceCanvasView
        android:id="@+id/workspaceCanvas"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="#F5F5F5" />

    <!-- Top Bar: Category Chips -->
    <HorizontalScrollView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_gravity="top"
        android:background="#E8ECEF"
        android:padding="8dp"
        android:scrollbars="none">

        <LinearLayout
            android:id="@+id/categoryChips"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:orientation="horizontal" />
    </HorizontalScrollView>

    <!-- Left Flyout Palette for active category blocks -->
    <LinearLayout
        android:layout_width="220dp"
        android:layout_height="wrap_content"
        android:layout_gravity="start|top"
        android:layout_marginTop="60dp"
        android:layout_marginStart="8dp"
        android:background="#CCFFFFFF"
        android:padding="8dp"
        android:elevation="4dp"
        android:orientation="vertical">

        <TextView
            android:id="@+id/activeCategoryTitle"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Blocks"
            android:textStyle="bold"
            android:textSize="14sp"
            android:paddingBottom="6dp" />

        <LinearLayout
            android:id="@+id/toolboxPalette"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:orientation="vertical" />
    </LinearLayout>

    <!-- Floating Canvas Controls (Right Side) -->
    <LinearLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="end|bottom"
        android:layout_margin="16dp"
        android:orientation="vertical"
        android:elevation="6dp">

        <Button
            android:id="@+id/btnZoomIn"
            android:layout_width="48dp"
            android:layout_height="48dp"
            android:text="+"
            android:textSize="18sp"
            android:background="#80FFFFFF"
            android:textColor="#333333" />

        <Button
            android:id="@+id/btnZoomOut"
            android:layout_width="48dp"
            android:layout_height="48dp"
            android:layout_marginTop="6dp"
            android:text="-"
            android:textSize="18sp"
            android:background="#80FFFFFF"
            android:textColor="#333333" />

        <Button
            android:id="@+id/btnResetView"
            android:layout_width="48dp"
            android:layout_height="48dp"
            android:layout_marginTop="6dp"
            android:text="⌖"
            android:textSize="18sp"
            android:background="#80FFFFFF"
            android:textColor="#333333" />

        <Button
            android:id="@+id/btnClear"
            android:layout_width="48dp"
            android:layout_height="48dp"
            android:layout_marginTop="6dp"
            android:text="🗑"
            android:textSize="18sp"
            android:background="#FFCDD2"
            android:textColor="#B71C1C" />
    </LinearLayout>

</FrameLayout>
""")

write("blockly/src/main/res/values/colors.xml", """<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="blockly_primary">#2196F3</color>
    <color name="blockly_accent">#FF9800</color>
</resources>
""")

write("blockly/src/main/res/values/dimens.xml", """<?xml version="1.0" encoding="utf-8"?>
<resources>
    <dimen name="blockly_margin">16dp</dimen>
</resources>
""")

write("blockly/src/main/res/values/styles.xml", """<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="BlocklyTheme" parent="Theme.AppCompat.Light.NoActionBar">
    </style>
</resources>
""")

# ==============================================================================
# 5. UNIT TESTS
# ==============================================================================

write("blockly/src/test/java/com/devbox/blockly/BlockSpecParserTest.java", """package com.devbox.blockly;

import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockSpecParser;
import com.devbox.blockly.model.CategoryDef;
import org.junit.Assert;
import org.junit.Test;
import java.util.List;

public class BlockSpecParserTest {

    private static final String BLOCKS_JSON = "[\\n" +
            "  {\\n" +
            "    \\"type\\": \\"led_toggle\\",\\n" +
            "    \\"message\\": \\"Set pin %1 to %2\\",\\n" +
            "    \\"color\\": \\"#4CAF50\\",\\n" +
            "    \\"fields\\": [\\n" +
            "      { \\"name\\": \\"PIN\\", \\"type\\": \\"dropdown\\", \\"options\\": [\\"13\\", \\"12\\"], \\"default\\": \\"13\\" },\\n" +
            "      { \\"name\\": \\"STATE\\", \\"type\\": \\"dropdown\\", \\"options\\": [\\"HIGH\\", \\"LOW\\"], \\"default\\": \\"HIGH\\" }\\n" +
            "    ],\\n" +
            "    \\"code\\": \\"digitalWrite(%PIN%, %STATE%);\\\\n\\"\\n" +
            "  }\\n" +
            "]";

    private static final String CATS_JSON = "[\\n" +
            "  {\\n" +
            "    \\"id\\": \\"hw\\",\\n" +
            "    \\"name\\": \\"Hardware\\",\\n" +
            "    \\"color\\": \\"#4CAF50\\",\\n" +
            "    \\"blocks\\": [\\"led_toggle\\"]\\n" +
            "  }\\n" +
            "]";

    @Test
    public void testParseBlocks() throws Exception {
        List<BlockDef> blocks = BlockSpecParser.parseBlocks(BLOCKS_JSON);
        Assert.assertEquals(1, blocks.size());
        BlockDef def = blocks.get(0);
        Assert.assertEquals("led_toggle", def.getType());
        Assert.assertEquals(2, def.getFields().size());
        Assert.assertEquals("PIN", def.getFields().get(0).getName());
        Assert.assertEquals("13", def.getFields().get(0).getDefaultValue());
    }

    @Test
    public void testParseCategories() throws Exception {
        List<CategoryDef> cats = BlockSpecParser.parseCategories(CATS_JSON);
        Assert.assertEquals(1, cats.size());
        CategoryDef cat = cats.get(0);
        Assert.assertEquals("Hardware", cat.getName());
        Assert.assertEquals(1, cat.getBlockTypes().size());
        Assert.assertEquals("led_toggle", cat.getBlockTypes().get(0));
    }
}
""")

write("blockly/src/test/java/com/devbox/blockly/CodeGeneratorTest.java", """package com.devbox.blockly;

import com.devbox.blockly.codegen.CodeGenerator;
import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockInstance;
import com.devbox.blockly.model.FieldDef;
import com.devbox.blockly.model.Workspace;
import org.junit.Assert;
import org.junit.Test;
import java.util.ArrayList;
import java.util.List;

public class CodeGeneratorTest {

    @Test
    public void testChainedCodeGeneration() {
        List<FieldDef> fields = new ArrayList<>();
        fields.add(new FieldDef("PIN", "dropdown", "13", List.of("13")));
        fields.add(new FieldDef("STATE", "dropdown", "HIGH", List.of("HIGH")));

        BlockDef ledDef = new BlockDef("led", "LED", 0, fields, false, null, true, true, "digitalWrite(%PIN%, %STATE%);\\n");
        BlockDef delayDef = new BlockDef("delay", "Wait", 0, List.of(new FieldDef("MS", "number", "1000", null)), false, null, true, true, "delay(%MS%);\\n");

        Workspace ws = new Workspace();
        BlockInstance b1 = new BlockInstance(ledDef, 0, 0);
        BlockInstance b2 = new BlockInstance(delayDef, 0, 50);

        b1.next = b2;
        b2.previous = b1;

        ws.addBlock(b1);
        ws.addBlock(b2);

        CodeGenerator gen = new CodeGenerator();
        String code = gen.generate(ws);

        String expected = "digitalWrite(13, HIGH);\\ndelay(1000);\\n";
        Assert.assertEquals(expected, code);
    }

    @Test
    public void testNestedLoopCodeGeneration() {
        BlockDef loopDef = new BlockDef("loop", "Repeat", 0, List.of(new FieldDef("COUNT", "number", "5", null)), true, "DO", true, true, "for (int i = 0; i < %COUNT%; i++) {\\n%DO%}\\n");
        BlockDef delayDef = new BlockDef("delay", "Wait", 0, List.of(new FieldDef("MS", "number", "500", null)), false, null, true, true, "delay(%MS%);\\n");

        Workspace ws = new Workspace();
        BlockInstance loopBlock = new BlockInstance(loopDef, 0, 0);
        BlockInstance childBlock = new BlockInstance(delayDef, 20, 40);

        loopBlock.statementChild = childBlock;
        childBlock.parentStatement = loopBlock;

        ws.addBlock(loopBlock);
        ws.addBlock(childBlock);

        CodeGenerator gen = new CodeGenerator();
        String code = gen.generate(ws);

        String expected = "for (int i = 0; i < 5; i++) {\\n  delay(500);\\n}\\n";
        Assert.assertEquals(expected, code);
    }
}
""")

# ==============================================================================
# 6. DEMO APP
# ==============================================================================

write("app/build.gradle", """plugins {
    id 'com.android.application'
}

android {
    namespace 'com.devbox.blockly.demo'
    compileSdk 34

    defaultConfig {
        applicationId "com.devbox.blockly.demo"
        minSdk 21
        targetSdk 34
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
}

dependencies {
    implementation project(':blockly')
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'com.google.android.material:material:1.11.0'
}
""")

write("app/src/main/AndroidManifest.xml", """<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application
        android:allowBackup="true"
        android:icon="@android:drawable/sym_def_app_icon"
        android:label="Modern Blockly Demo"
        android:roundIcon="@android:drawable/sym_def_app_icon"
        android:supportsRtl="true"
        android:theme="@style/Theme.ModernBlockly">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
""")

write("app/src/main/assets/blocks.json", """[
  {
    "type": "led_toggle",
    "message": "Set LED on pin %1 to %2",
    "color": "#4CAF50",
    "fields": [
      { "name": "PIN", "type": "dropdown", "options": ["13", "12", "11", "10"], "default": "13" },
      { "name": "STATE", "type": "dropdown", "options": ["HIGH", "LOW"], "default": "HIGH" }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "digitalWrite(%PIN%, %STATE%);\\n"
  },
  {
    "type": "delay_wait",
    "message": "Wait %1 ms",
    "color": "#FF9800",
    "fields": [
      { "name": "MS", "type": "number", "default": 1000 }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "delay(%MS%);\\n"
  },
  {
    "type": "repeat_loop",
    "message": "Repeat %1 times",
    "color": "#2196F3",
    "fields": [
      { "name": "COUNT", "type": "number", "default": 5 }
    ],
    "statements": [
      { "name": "DO" }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "for (int i = 0; i < %COUNT%; i++) {\\n%DO%}\\n"
  },
  {
    "type": "print_message",
    "message": "Serial Print: %1",
    "color": "#9C27B0",
    "fields": [
      { "name": "TEXT", "type": "text", "default": "Hello World!" }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "Serial.println(\\"%TEXT%\\");\\n"
  }
]
""")

write("app/src/main/assets/categories.json", """[
  {
    "id": "hardware",
    "name": "Hardware",
    "color": "#4CAF50",
    "blocks": ["led_toggle"]
  },
  {
    "id": "timing",
    "name": "Timing",
    "color": "#FF9800",
    "blocks": ["delay_wait"]
  },
  {
    "id": "control",
    "name": "Control",
    "color": "#2196F3",
    "blocks": ["repeat_loop"]
  },
  {
    "id": "output",
    "name": "Serial",
    "color": "#9C27B0",
    "blocks": ["print_message"]
  }
]
""")

write("app/src/main/java/com/devbox/blockly/demo/MainActivity.java", """package com.devbox.blockly.demo;

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import com.devbox.blockly.BlocklyView;

public class MainActivity extends AppCompatActivity {

    private BlocklyView blocklyView;
    private TextView tvLiveCode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        blocklyView = findViewById(R.id.blocklyView);
        tvLiveCode = findViewById(R.id.tvLiveCode);

        // 🚀 1-STEP INITIALIZATION: Just point to the two JSON files in assets!
        blocklyView.initFromAssets("blocks.json", "categories.json");

        // Live code update on workspace changes
        blocklyView.setOnWorkspaceChangedListener(() -> {
            updateCodePreview();
        });

        findViewById(R.id.btnGenerateCode).setOnClickListener(v -> {
            String code = blocklyView.generateCode();
            new AlertDialog.Builder(this)
                    .setTitle("Generated Arduino Code")
                    .setMessage(code.isEmpty() ? "// Workspace is empty. Add blocks to generate code!" : code)
                    .setPositiveButton("Close", null)
                    .show();
        });

        updateCodePreview();
    }

    private void updateCodePreview() {
        String code = blocklyView.generateCode();
        if (code.isEmpty()) {
            tvLiveCode.setText("// Add blocks to preview code...");
        } else {
            tvLiveCode.setText(code);
        }
    }
}
""")

write("app/src/main/res/layout/activity_main.xml", """<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <!-- Top Action Bar -->
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="56dp"
        android:background="#1976D2"
        android:gravity="center_vertical"
        android:paddingHorizontal="16dp"
        android:orientation="horizontal">

        <TextView
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="Modern Blockly Demo"
            android:textColor="#FFFFFF"
            android:textSize="18sp"
            android:textStyle="bold" />

        <Button
            android:id="@+id/btnGenerateCode"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:backgroundTint="#FF9800"
            android:text="View Code"
            android:textColor="#FFFFFF" />
    </LinearLayout>

    <!-- Main Blockly Workspace View (Drop-in Component) -->
    <com.devbox.blockly.BlocklyView
        android:id="@+id/blocklyView"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1" />

    <!-- Live Code Preview Panel -->
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="120dp"
        android:background="#263238"
        android:padding="8dp"
        android:orientation="vertical">

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="LIVE CODE PREVIEW"
            android:textColor="#80CBC4"
            android:textSize="11sp"
            android:textStyle="bold" />

        <ScrollView
            android:layout_width="match_parent"
            android:layout_height="match_parent">

            <TextView
                android:id="@+id/tvLiveCode"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:fontFamily="monospace"
                android:textColor="#FFFFFF"
                android:textSize="12sp" />
        </ScrollView>
    </LinearLayout>

</LinearLayout>
""")

write("app/src/main/res/values/strings.xml", """<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Modern Blockly Demo</string>
</resources>
""")

write("app/src/main/res/values/themes.xml", """<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="Theme.ModernBlockly" parent="Theme.MaterialComponents.Light.NoActionBar">
        <item name="colorPrimary">#1976D2</item>
        <item name="colorPrimaryDark">#0D47A1</item>
        <item name="colorAccent">#FF9800</item>
    </style>
</resources>
""")

print("ALL FILES GENERATED SUCCESSFULLY!")
