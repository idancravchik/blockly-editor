package com.google.blockly.android.codegen;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.blockly.model.Block;
import com.google.blockly.model.Field;
import com.google.blockly.model.Input;
import com.google.blockly.model.Workspace;

import java.util.HashMap;
import java.util.Map;

/**
 * Extensible, pure-Java code generator operating directly on Blockly AST models.
 * Completely eliminates the need for headless WebViews, V8 engines, or JavaScript generator scripts.
 */
public class JavaCodeGenerator implements BlockVisitor {

    @FunctionalInterface
    public interface BlockHandler {
        /**
         * Generates code for a single block.
         *
         * @param block The block instance.
         * @param generator The generator instance for recursive evaluation.
         * @return The code snippet for this block.
         */
        @NonNull
        String generate(@NonNull Block block, @NonNull JavaCodeGenerator generator);
    }

    private final Map<String, BlockHandler> mHandlers = new HashMap<>();
    private String mIndent = "  ";

    public JavaCodeGenerator() {
    }

    /**
     * Registers a custom code handler for a specific block type string.
     */
    public void registerHandler(@NonNull String blockType, @NonNull BlockHandler handler) {
        mHandlers.put(blockType, handler);
    }

    public void setIndent(@NonNull String indent) {
        mIndent = indent;
    }

    @NonNull
    public String getIndent() {
        return mIndent;
    }

    /**
     * Generates code for an entire workspace.
     */
    @NonNull
    public String workspaceToCode(@NonNull Workspace workspace) {
        onBeginWorkspace(workspace);
        StringBuilder sb = new StringBuilder();

        for (Block root : workspace.getRootBlocks()) {
            sb.append(blockToCode(root));
        }

        return onEndWorkspace(workspace, sb.toString());
    }

    /**
     * Generates code for a block and all blocks chained sequentially after it.
     */
    @NonNull
    public String blockToCode(@Nullable Block block) {
        if (block == null) {
            return "";
        }

        String code = visitBlock(block);
        Block nextBlock = block.getNextBlock();
        return code + blockToCode(nextBlock);
    }

    /**
     * Evaluates child blocks connected to a statement input socket.
     */
    @NonNull
    public String statementToCode(@NonNull Block block, @NonNull String inputName) {
        Input input = block.getInputByName(inputName);
        if (input == null || input.getConnection() == null) {
            return "";
        }
        Block connected = input.getConnection().getTargetBlock();
        return visitStatementInput(block, inputName, connected);
    }

    /**
     * Evaluates the block connected to a value input socket.
     */
    @NonNull
    public String valueToCode(@NonNull Block block, @NonNull String inputName) {
        Input input = block.getInputByName(inputName);
        if (input == null || input.getConnection() == null) {
            return "";
        }
        Block connected = input.getConnection().getTargetBlock();
        return visitValueInput(block, inputName, connected);
    }

    /**
     * Safely reads the serialized string value of an input field on a block.
     */
    @NonNull
    public String getFieldValue(@NonNull Block block, @NonNull String fieldName, @NonNull String defaultValue) {
        Field field = block.getFieldByName(fieldName);
        if (field == null) {
            return defaultValue;
        }
        String val = field.getSerializedValue();
        return val != null ? val : defaultValue;
    }

    /**
     * Helper to indent multiple lines of code.
     */
    @NonNull
    public String prefixLines(@NonNull String text, @NonNull String prefix) {
        if (text.isEmpty()) {
            return "";
        }
        return prefix + text.replace("\n", "\n" + prefix).replaceAll(prefix + "$", "");
    }

    // --- BlockVisitor Implementation ---

    @Override
    public void onBeginWorkspace(@NonNull Workspace workspace) {
        // Subclasses can initialize headers, definitions, and symbol tables here
    }

    @NonNull
    @Override
    public String visitBlock(@NonNull Block block) {
        BlockHandler handler = mHandlers.get(block.getType());
        if (handler != null) {
            return handler.generate(block, this);
        }
        return "/* Missing handler for: " + block.getType() + " */\n";
    }

    @NonNull
    @Override
    public String visitStatementInput(@NonNull Block parentBlock, @NonNull String inputName, @Nullable Block firstChild) {
        if (firstChild == null) {
            return "";
        }
        String body = blockToCode(firstChild);
        return prefixLines(body, mIndent);
    }

    @NonNull
    @Override
    public String visitValueInput(@NonNull Block parentBlock, @NonNull String inputName, @Nullable Block connectedBlock) {
        if (connectedBlock == null) {
            return "";
        }
        BlockHandler handler = mHandlers.get(connectedBlock.getType());
        if (handler != null) {
            return handler.generate(connectedBlock, this);
        }
        return "";
    }

    @NonNull
    @Override
    public String onEndWorkspace(@NonNull Workspace workspace, @NonNull String body) {
        return body;
    }
}
