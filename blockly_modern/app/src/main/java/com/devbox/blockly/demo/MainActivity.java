package com.devbox.blockly.demo;

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import com.blockly.android.BlocklyView;

public class MainActivity extends AppCompatActivity {

    private BlocklyView blocklyView;
    private TextView tvLiveCode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        blocklyView = findViewById(R.id.blocklyView);
        tvLiveCode = findViewById(R.id.tvLiveCode);

        // 🚀 1-STEP INITIALIZATION: Point directly to the two JSON files in assets!
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
