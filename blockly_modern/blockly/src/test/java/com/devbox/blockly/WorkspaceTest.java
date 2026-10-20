package com.devbox.blockly;

import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockInstance;
import com.devbox.blockly.model.Workspace;
import org.junit.Assert;
import org.junit.Test;
import java.util.Collections;

public class WorkspaceTest {

    @Test
    public void testWorkspaceAddAndConnect() {
        Workspace ws = new Workspace();
        BlockDef def = new BlockDef("test", "Test", 0, Collections.emptyList(), false, null, true, true, "test();\n");

        BlockInstance b1 = new BlockInstance(def, 10, 10);
        BlockInstance b2 = new BlockInstance(def, 10, 60);

        ws.addBlock(b1);
        ws.addBlock(b2);

        Assert.assertEquals(2, ws.getAllBlocks().size());
        Assert.assertEquals(2, ws.getRootBlocks().size());

        // Connect b2 below b1
        b1.next = b2;
        b2.previous = b1;

        Assert.assertEquals(1, ws.getRootBlocks().size());
        Assert.assertSame(b1, ws.getRootBlocks().get(0));

        // Detach b2
        b2.detachFromParent();
        Assert.assertNull(b1.next);
        Assert.assertNull(b2.previous);
        Assert.assertEquals(2, ws.getRootBlocks().size());

        // Delete b1
        ws.removeBlock(b1);
        Assert.assertEquals(1, ws.getAllBlocks().size());
        Assert.assertSame(b2, ws.getAllBlocks().get(0));
    }
}
