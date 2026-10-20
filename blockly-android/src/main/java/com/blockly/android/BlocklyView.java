package com.blockly.android;

import android.content.Context;
import android.graphics.Color;
import android.util.AttributeSet;
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
            public void onBlockSelected(com.blockly.android.model.BlockInstance block) {}
        });

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
        InputStream is = getContext().getAssets().open(filename);
        byte[] bytes = new byte[is.available()];
        is.read(bytes);
        is.close();
        return new String(bytes, StandardCharsets.UTF_8);
    }
}
