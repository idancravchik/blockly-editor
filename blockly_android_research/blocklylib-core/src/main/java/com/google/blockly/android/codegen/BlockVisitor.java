package com.google.blockly.android.codegen;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.blockly.model.Block;
import com.google.blockly.model.Field;
import com.google.blockly.model.Input;
import com.google.blockly.model.Workspace;

/**
 * Interface defining a visitor pattern over the Blockly Abstract Syntax Tree (AST) in Java.
 * Language-agnostic: implementations can emit C, Python, JavaScript, or any target syntax.
 */
public interface BlockVisitor {

    /**
     * Called before traversing the workspace.
     */
    void onBeginWorkspace(@NonNull Workspace workspace);

    /**
     * Called when visiting a specific block.
     *
     * @param block The block being visited.
     * @return Any generated code or representation for this block.
     */
    @NonNull
    String visitBlock(@NonNull Block block);

    /**
     * Called when visiting a statement branch (e.g. inside an if block or loop).
     *
     * @param parentBlock The block containing the statement input.
     * @param inputName The name of the statement input.
     * @param firstChild The first block connected to this statement branch, or null if empty.
     * @return The generated code for the statement body.
     */
    @NonNull
    String visitStatementInput(@NonNull Block parentBlock, @NonNull String inputName, @Nullable Block firstChild);

    /**
     * Called when evaluating a value input expression (e.g. a condition or math expression).
     *
     * @param parentBlock The block requesting the value.
     * @param inputName The name of the value input.
     * @param connectedBlock The block providing the value, or null if empty.
     * @return The evaluated value string.
     */
    @NonNull
    String visitValueInput(@NonNull Block parentBlock, @NonNull String inputName, @Nullable Block connectedBlock);

    /**
     * Called after all root blocks in the workspace have been traversed.
     *
     * @param workspace The workspace that was visited.
     * @param body The concatenated output from all top-level statements.
     * @return The final completed program/script.
     */
    @NonNull
    String onEndWorkspace(@NonNull Workspace workspace, @NonNull String body);
}
