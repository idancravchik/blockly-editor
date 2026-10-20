package com.devbox.blockly.model;

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
