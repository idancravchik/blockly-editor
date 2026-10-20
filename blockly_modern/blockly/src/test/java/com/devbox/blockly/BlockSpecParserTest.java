package com.devbox.blockly;

import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockSpecParser;
import com.devbox.blockly.model.CategoryDef;
import org.junit.Assert;
import org.junit.Test;
import java.util.List;

public class BlockSpecParserTest {

    private static final String BLOCKS_JSON = "[\n" +
            "  {\n" +
            "    \"type\": \"led_toggle\",\n" +
            "    \"message\": \"Set pin %1 to %2\",\n" +
            "    \"color\": \"#4CAF50\",\n" +
            "    \"fields\": [\n" +
            "      { \"name\": \"PIN\", \"type\": \"dropdown\", \"options\": [\"13\", \"12\"], \"default\": \"13\" },\n" +
            "      { \"name\": \"STATE\", \"type\": \"dropdown\", \"options\": [\"HIGH\", \"LOW\"], \"default\": \"HIGH\" }\n" +
            "    ],\n" +
            "    \"code\": \"digitalWrite(%PIN%, %STATE%);\\n\"\n" +
            "  }\n" +
            "]";

    private static final String CATS_JSON = "[\n" +
            "  {\n" +
            "    \"id\": \"hw\",\n" +
            "    \"name\": \"Hardware\",\n" +
            "    \"color\": \"#4CAF50\",\n" +
            "    \"blocks\": [\"led_toggle\"]\n" +
            "  }\n" +
            "]";

    @Test
    public void testParseBlocks() throws Exception {
        List<BlockDef> blocks = BlockSpecParser.parseBlocks(BLOCKS_JSON);
        Assert.assertEquals(1, blocks.size());
        BlockDef def = blocks.get(0);
        Assert.assertEquals("led_toggle", def.getType());
        Assert.assertEquals(2, def.getFields().size());
        Assert.assertEquals("PIN", def.getFields().get(0).getName());
        Assert.assertEquals("13", def.getFields().get(0).getDefaultValue());
    }

    @Test
    public void testParseCategories() throws Exception {
        List<CategoryDef> cats = BlockSpecParser.parseCategories(CATS_JSON);
        Assert.assertEquals(1, cats.size());
        CategoryDef cat = cats.get(0);
        Assert.assertEquals("Hardware", cat.getName());
        Assert.assertEquals(1, cat.getBlockTypes().size());
        Assert.assertEquals("led_toggle", cat.getBlockTypes().get(0));
    }
}
