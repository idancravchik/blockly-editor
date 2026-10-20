package com.blockly.android;

import com.blockly.android.model.*;
import org.junit.Test;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static org.junit.Assert.*;

public class WorkspaceSerializerTest {

    @Test
    public void testSerializeAndDeserialize() throws Exception {
        BlockDef pinDef = new BlockDef("gpio_set", "Set Pin", 0,
                List.of(new FieldDef("PIN", "number", "13", List.of())),
                false, "DO", true, true, "set(%PIN%);\n");

        Map<String, BlockDef> blockMap = new HashMap<>();
        blockMap.put("gpio_set", pinDef);

        Workspace ws1 = new Workspace();
        BlockInstance b1 = new BlockInstance("id_1", pinDef, 50, 100);
        b1.setFieldValue("PIN", "7");
        BlockInstance b2 = new BlockInstance("id_2", pinDef, 50, 144);
        b2.setFieldValue("PIN", "8");
        b1.next = b2;
        b2.previous = b1;

        ws1.addBlock(b1);
        ws1.addBlock(b2);

        String json = WorkspaceSerializer.serializeToJson(ws1);
        assertTrue(json.contains("id_1"));
        assertTrue(json.contains("id_2"));
        assertTrue(json.contains("\"PIN\": \"7\"") || json.contains("\"PIN\":\"7\""));

        Workspace ws2 = new Workspace();
        WorkspaceSerializer.deserializeFromJson(json, ws2, blockMap);

        assertEquals(2, ws2.getAllBlocks().size());
        assertEquals(1, ws2.getRootBlocks().size());

        BlockInstance root = ws2.getRootBlocks().get(0);
        assertEquals("id_1", root.getId());
        assertEquals("7", root.getFieldValue("PIN"));
        assertNotNull(root.next);
        assertEquals("id_2", root.next.getId());
        assertEquals("8", root.next.getFieldValue("PIN"));
        assertEquals(root, root.next.previous);
    }
}
