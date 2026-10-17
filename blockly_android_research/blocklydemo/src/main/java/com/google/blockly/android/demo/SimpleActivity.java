/*
 *  Copyright 2016 Google Inc. All Rights Reserved.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.google.blockly.android.demo;

import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;

import com.google.blockly.android.AbstractBlocklyActivity;
import com.google.blockly.android.codegen.JavaCodeGenerator;
import com.google.blockly.model.DefaultBlocks;

import java.util.List;

/**
 * Simplest implementation of AbstractBlocklyActivity using 100% pure Java code generation.
 */
public class SimpleActivity extends AbstractBlocklyActivity {
    private static final String TAG = "SimpleActivity";

    private static final String SAVE_FILENAME = "simple_workspace.xml";
    private static final String AUTOSAVE_FILENAME = "simple_workspace_temp.xml";

    private static final List<String> BLOCK_DEFINITIONS = DefaultBlocks.getAllBlockDefinitions();

    private JavaCodeGenerator mJavaCodeGenerator;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        initJavaGenerator();
    }

    private void initJavaGenerator() {
        mJavaCodeGenerator = new JavaCodeGenerator();

        // Register default block handlers in Java
        mJavaCodeGenerator.registerHandler("controls_if", (block, gen) -> {
            String cond = gen.valueToCode(block, "IF0");
            if (cond.isEmpty()) cond = "true";
            String doCode = gen.statementToCode(block, "DO0");
            return "if (" + cond + ") {\n" + doCode + "}\n";
        });

        mJavaCodeGenerator.registerHandler("controls_repeat_ext", (block, gen) -> {
            String times = gen.valueToCode(block, "TIMES");
            if (times.isEmpty()) times = "10";
            String doCode = gen.statementToCode(block, "DO");
            return "for (int i = 0; i < " + times + "; i++) {\n" + doCode + "}\n";
        });

        mJavaCodeGenerator.registerHandler("math_number", (block, gen) -> {
            return gen.getFieldValue(block, "NUM", "0");
        });

        mJavaCodeGenerator.registerHandler("logic_boolean", (block, gen) -> {
            return gen.getFieldValue(block, "BOOL", "TRUE").toLowerCase();
        });
    }

    /**
     * Overriding onRunCode to execute 100% pure-Java code generation without any WebView or JavaScript!
     */
    @Override
    protected void onRunCode() {
        if (mJavaCodeGenerator == null) {
            initJavaGenerator();
        }

        String generatedCode = generateCodeWithJava(mJavaCodeGenerator);
        if (generatedCode.trim().isEmpty()) {
            generatedCode = "// Workspace is empty. Drag some blocks into the workspace!";
        }

        new AlertDialog.Builder(this)
                .setTitle("Generated Code (Pure Java AST)")
                .setMessage(generatedCode)
                .setPositiveButton("OK", null)
                .show();
    }

    @NonNull
    @Override
    protected List<String> getBlockDefinitionsJsonPaths() {
        return BLOCK_DEFINITIONS;
    }

    @NonNull
    @Override
    protected String getToolboxContentsXmlPath() {
        return DefaultBlocks.TOOLBOX_PATH;
    }

    @Override
    @NonNull
    protected String getWorkspaceSavePath() {
        return SAVE_FILENAME;
    }

    @Override
    @NonNull
    protected String getWorkspaceAutosavePath() {
        return AUTOSAVE_FILENAME;
    }
}
