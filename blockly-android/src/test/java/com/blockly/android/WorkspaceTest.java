package com.blockly.android;

import com.blockly.android.model.BlockDef;
import com.blockly.android.model.BlockInstance;
import com.blockly.android.model.Workspace;
import org.junit.Test;
import java.util.ArrayList;
import static org.junit.Assert.*;

public class WorkspaceTest {

    @Test
    public void testWorkspaceAddRemove() {
        BlockDef dummyDef = new BlockDef("dummy", "Dummy", 0, new ArrayList<>(), false, "DO", true, true, "test();\n");
        BlockInstance b1 = new BlockInstance(dummyDef, 0, 0);
        BlockInstance b2 = new BlockInstance(dummyDef, 0, 0);

        Workspace ws = new Workspace();
        ws.addBlock(b1);
        ws.addBlock(b2);
        b1.next = b2;
        b2.previous = b1;

        assertEquals(2, ws.getAllBlocks().size());
        assertEquals(1, ws.getRootBlocks().size());

        ws.removeBlock(b1);
        assertNull(b2.previous);
        assertEquals(1, ws.getAllBlocks().size());
        assertEquals(1, ws.getRootBlocks().size());
    }
}
