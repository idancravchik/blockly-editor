package com.blockly.android.model;

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
