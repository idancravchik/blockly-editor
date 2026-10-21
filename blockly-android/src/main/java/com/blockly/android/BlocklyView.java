package com.blockly.android;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.blockly.android.codegen.CodeGenerator;
import com.blockly.android.model.BlockDef;
import com.blockly.android.model.BlockSpecParser;
import com.blockly.android.model.CategoryDef;
import com.blockly.android.model.Workspace;
import com.blockly.android.model.WorkspaceSerializer;
import com.blockly.android.view.WorkspaceCanvasView;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlocklyView extends FrameLayout {

    private static final String TAG = "BlocklyAndroid";

    private static final String DEFAULT_FALLBACK_BLOCKS = "[\n" +
            "  {\n" +
            "    \"type\": \"gpio_set\",\n" +
            "    \"message\": \"Set Digital Pin\",\n" +
            "    \"color\": \"#4CAF50\",\n" +
            "    \"fields\": [\n" +
            "      {\"name\": \"PIN\", \"type\": \"dropdown\", \"default\": \"13\", \"options\": [\"13\", \"12\", \"11\", \"2\"]},\n" +
            "      {\"name\": \"STATE\", \"type\": \"dropdown\", \"default\": \"HIGH\", \"options\": [\"HIGH\", \"LOW\"]}\n" +
            "    ],\n" +
            "    \"previousStatement\": true,\n" +
            "    \"nextStatement\": true,\n" +
            "    \"code\": \"pinMode(%PIN%, OUTPUT);\\ndigitalWrite(%PIN%, %STATE%);\\n\"\n" +
            "  },\n" +
            "  {\n" +
            "    \"type\": \"delay_ms\",\n" +
            "    \"message\": \"Delay Milliseconds\",\n" +
            "    \"color\": \"#FF9800\",\n" +
            "    \"fields\": [\n" +
            "      {\"name\": \"MS\", \"type\": \"number\", \"default\": \"500\"}\n" +
            "    ],\n" +
            "    \"previousStatement\": true,\n" +
            "    \"nextStatement\": true,\n" +
            "    \"code\": \"delay(%MS%);\\n\"\n" +
            "  },\n" +
            "  {\n" +
            "    \"type\": \"loop_forever\",\n" +
            "    \"message\": \"Repeat Forever\",\n" +
            "    \"color\": \"#2196F3\",\n" +
            "    \"statements\": [{\"name\": \"DO\"}],\n" +
            "    \"previousStatement\": true,\n" +
            "    \"nextStatement\": true,\n" +
            "    \"code\": \"while (true) {\\n%DO%}\\n\"\n" +
            "  }\n" +
            "]";

    private static final String DEFAULT_FALLBACK_CATEGORIES = "[\n" +
            "  {\"id\": \"gpio\", \"name\": \"GPIO\", \"color\": \"#4CAF50\", \"blocks\": [\"gpio_set\"]},\n" +
            "  {\"id\": \"timing\", \"name\": \"Timing\", \"color\": \"#FF9800\", \"blocks\": [\"delay_ms\"]},\n" +
            "  {\"id\": \"control\", \"name\": \"Control\", \"color\": \"#2196F3\", \"blocks\": [\"loop_forever\"]}\n" +
            "]";

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

    public BlocklyView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context);
    }

    public BlocklyView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(context);
    }

    private void init(Context context) {
        setBackgroundColor(Color.parseColor("#F5F5F5"));

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
            public void onBlockSelected(com.blockly.android.model.BlockInstance block) {}
        });

        findViewById(R.id.btnZoomIn).setOnClickListener(v -> canvasView.zoomIn());
        findViewById(R.id.btnZoomOut).setOnClickListener(v -> canvasView.zoomOut());
        findViewById(R.id.btnResetView).setOnClickListener(v -> canvasView.resetView());
        findViewById(R.id.btnClear).setOnClickListener(v -> clearWorkspace());

        // Initialize with default fallback blocks right away so canvas is never empty
        initFromStrings(DEFAULT_FALLBACK_BLOCKS, DEFAULT_FALLBACK_CATEGORIES);
    }

    public void initFromAssets(String blocksAsset, String categoriesAsset) {
        try {
            String blocksJson = loadAssetString(blocksAsset);
            String catsJson = loadAssetString(categoriesAsset);
            initFromStrings(blocksJson, catsJson);
            Log.d(TAG, "Successfully loaded blocks and categories from assets.");
        } catch (Exception e) {
            Log.w(TAG, "Could not load assets (" + blocksAsset + ", " + categoriesAsset + "): "
                    + e.getMessage() + ". Using built-in default blocks instead.");
            initFromStrings(DEFAULT_FALLBACK_BLOCKS, DEFAULT_FALLBACK_CATEGORIES);
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
            Log.e(TAG, "Failed to parse blocks/categories JSON: " + e.getMessage(), e);
        }
    }

    private void buildToolboxUI() {
        if (categoryChipsLayout == null) return;
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
        if (activeCategoryTitle != null) {
            activeCategoryTitle.setText(cat.getName() + " Blocks");
            activeCategoryTitle.setTextColor(cat.getColor());
        }
        if (toolboxPalette == null) return;
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

    public String saveWorkspaceToJson() throws Exception {
        return WorkspaceSerializer.serializeToJson(canvasView.getWorkspace());
    }

    public void loadWorkspaceFromJson(String json) throws Exception {
        WorkspaceSerializer.deserializeFromJson(json, canvasView.getWorkspace(), blockMap);
        canvasView.invalidate();
        if (workspaceChangedListener != null) workspaceChangedListener.onWorkspaceChanged();
    }

    public Workspace getWorkspace() {
        return canvasView.getWorkspace();
    }

    public CodeGenerator getCodeGenerator() {
        return codeGenerator;
    }

    public void setOnWorkspaceChangedListener(OnWorkspaceChangedListener listener) {
        this.workspaceChangedListener = listener;
    }

    private String loadAssetString(String filename) throws Exception {
        try (InputStream is = getContext().getAssets().open(filename);
             ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int len;
            while ((len = is.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }
            return baos.toString(StandardCharsets.UTF_8.name());
        }
    }
}
