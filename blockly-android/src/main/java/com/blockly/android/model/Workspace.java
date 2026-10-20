package com.blockly.android.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Workspace {
    private final List<BlockInstance> blocks = new ArrayList<>();

    public void addBlock(BlockInstance block) {
        if (!blocks.contains(block)) {
            blocks.add(block);
        }
    }

    public void removeBlock(BlockInstance block) {
        block.detachFromParent();
        if (block.next != null) {
            block.next.previous = null;
            block.next = null;
        }
        if (block.statementChild != null) {
            block.statementChild.parentStatement = null;
            block.statementChild = null;
        }
        blocks.remove(block);
    }

    public void clear() {
        blocks.clear();
    }

    public List<BlockInstance> getAllBlocks() {
        return Collections.unmodifiableList(blocks);
    }

    public List<BlockInstance> getRootBlocks() {
        List<BlockInstance> roots = new ArrayList<>();
        for (BlockInstance b : blocks) {
            if (b.previous == null && b.parentStatement == null) {
                roots.add(b);
            }
        }
        return roots;
    }
}
