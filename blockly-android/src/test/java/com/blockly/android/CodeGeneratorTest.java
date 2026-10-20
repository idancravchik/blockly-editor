package com.blockly.android;

import com.blockly.android.codegen.CodeGenerator;
import com.blockly.android.model.BlockDef;
import com.blockly.android.model.BlockInstance;
import com.blockly.android.model.FieldDef;
import com.blockly.android.model.Workspace;
import org.junit.Test;
import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.*;

public class CodeGeneratorTest {

    @Test
    public void testChainedCodeGeneration() {
        List<FieldDef> fields = new ArrayList<>();
        fields.add(new FieldDef("PIN", "dropdown", "13", List.of("13")));
        fields.add(new FieldDef("STATE", "dropdown", "HIGH", List.of("HIGH", "LOW")));

        BlockDef pinDef = new BlockDef("gpio_set", "Set Pin", 0, fields, false, "DO", true, true, "pinMode(%PIN%, OUTPUT);\ndigitalWrite(%PIN%, %STATE%);\n");
        BlockDef delayDef = new BlockDef("delay", "Delay", 0, List.of(new FieldDef("MS", "number", "1000", List.of())), false, "DO", true, true, "delay(%MS%);\n");

        BlockInstance b1 = new BlockInstance(pinDef, 0, 0);
        BlockInstance b2 = new BlockInstance(delayDef, 0, 0);
        b1.next = b2;
        b2.previous = b1;

        Workspace ws = new Workspace();
        ws.addBlock(b1);
        ws.addBlock(b2);

        CodeGenerator gen = new CodeGenerator();
        String code = gen.generate(ws);

        assertTrue(code.contains("pinMode(13, OUTPUT);"));
        assertTrue(code.contains("digitalWrite(13, HIGH);"));
        assertTrue(code.contains("delay(1000);"));
    }

    @Test
    public void testStatementLoopCodeGeneration() {
        BlockDef loopDef = new BlockDef("loop_forever", "Loop", 0, new ArrayList<>(), true, "DO", true, true, "while (true) {\n%DO%}\n");
        BlockDef delayDef = new BlockDef("delay", "Delay", 0, List.of(new FieldDef("MS", "number", "500", List.of())), false, "DO", true, true, "delay(%MS%);\n");

        BlockInstance loopBlock = new BlockInstance(loopDef, 0, 0);
        BlockInstance innerBlock = new BlockInstance(delayDef, 0, 0);

        loopBlock.statementChild = innerBlock;
        innerBlock.parentStatement = loopBlock;

        Workspace ws = new Workspace();
        ws.addBlock(loopBlock);
        ws.addBlock(innerBlock);

        CodeGenerator gen = new CodeGenerator();
        String code = gen.generate(ws);

        assertEquals("while (true) {\n  delay(500);\n}\n", code);
    }
}
