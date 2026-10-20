package com.blockly.android.codegen;

import com.blockly.android.model.BlockDef;
import com.blockly.android.model.BlockInstance;
import com.blockly.android.model.Workspace;

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
            return indent + "// [Block: " + def.getType() + "]\n";
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
        String[] lines = text.split("\n", -1);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < lines.length; i++) {
            if (i == lines.length - 1 && lines[i].isEmpty()) {
                break;
            }
            sb.append(prefix).append(lines[i]).append("\n");
        }
        return sb.toString();
    }
}
