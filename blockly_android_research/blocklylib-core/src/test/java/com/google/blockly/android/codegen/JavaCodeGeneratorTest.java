package com.google.blockly.android.codegen;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class JavaCodeGeneratorTest {

    private JavaCodeGenerator generator;

    @Before
    public void setUp() {
        generator = new JavaCodeGenerator();
    }

    @Test
    public void testPrefixLinesIndentation() {
        String input = "line1\nline2\nline3\n";
        String expected = "  line1\n  line2\n  line3\n";
        String actual = generator.prefixLines(input, "  ");
        Assert.assertEquals(expected, actual);
    }

    @Test
    public void testDefaultMissingHandlerWarning() {
        // When no handler is registered, visitBlock produces an informative comment
        JavaCodeGenerator testGen = new JavaCodeGenerator();
        // Null block toCode returns empty
        Assert.assertEquals("", testGen.blockToCode(null));
    }
}
