package com.blockly.android;

import com.blockly.android.model.BlockDef;
import com.blockly.android.model.BlockSpecParser;
import com.blockly.android.model.CategoryDef;
import org.junit.Test;
import java.util.List;
import static org.junit.Assert.*;

public class BlockSpecParserTest {

    @Test
    public void testParseBlocks() throws Exception {
        String json = "[{\"type\":\"delay_ms\",\"message\":\"Delay ms\",\"color\":\"#FF9800\",\"fields\":[{\"name\":\"MS\",\"type\":\"number\",\"default\":\"500\"}],\"code\":\"delay(%MS%);\\n\"}]";
        List<BlockDef> blocks = BlockSpecParser.parseBlocks(json);
        assertEquals(1, blocks.size());
        BlockDef b = blocks.get(0);
        assertEquals("delay_ms", b.getType());
        assertEquals("Delay ms", b.getMessage());
        assertEquals(1, b.getFields().size());
        assertEquals("MS", b.getFields().get(0).getName());
        assertEquals("delay(%MS%);\n", b.getCodeTemplate());
    }

    @Test
    public void testParseCategories() throws Exception {
        String json = "[{\"id\":\"gpio\",\"name\":\"GPIO\",\"color\":\"#4CAF50\",\"blocks\":[\"pin_mode\",\"digital_write\"]}]";
        List<CategoryDef> cats = BlockSpecParser.parseCategories(json);
        assertEquals(1, cats.size());
        assertEquals("gpio", cats.get(0).getId());
        assertEquals(2, cats.get(0).getBlockTypes().size());
    }
}
