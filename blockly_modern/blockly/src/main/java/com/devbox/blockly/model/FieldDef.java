package com.devbox.blockly.model;

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
