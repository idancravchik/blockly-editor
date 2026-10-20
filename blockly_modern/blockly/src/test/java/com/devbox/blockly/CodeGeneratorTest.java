package com.devbox.blockly;

import com.devbox.blockly.codegen.CodeGenerator;
import com.devbox.blockly.model.BlockDef;
import com.devbox.blockly.model.BlockInstance;
import com.devbox.blockly.model.FieldDef;
import com.devbox.blockly.model.Workspace;
import org.junit.Assert;
import org.junit.Test;
import java.util.ArrayList;
import java.util.List;

public class CodeGeneratorTest {

    @Test
    public void testChainedCodeGeneration() {
        List<FieldDef> fields = new ArrayList<>();
        fields.add(new FieldDef("PIN", "dropdown", "13", List.of("13")));
        fields.add(new FieldDef("STATE", "dropdown", "HIGH", List.of("HIGH")));

        BlockDef ledDef = new BlockDef("led", "LED", 0, fields, false, null, true, true, "digitalWrite(%PIN%, %STATE%);\n");
        BlockDef delayDef = new BlockDef("delay", "Wait", 0, List.of(new FieldDef("MS", "number", "1000", null)), false, null, true, true, "delay(%MS%);\n");

        Workspace ws = new Workspace();
        BlockInstance b1 = new BlockInstance(ledDef, 0, 0);
        BlockInstance b2 = new BlockInstance(delayDef, 0, 50);

        b1.next = b2;
        b2.previous = b1;

        ws.addBlock(b1);
        ws.addBlock(b2);

        CodeGenerator gen = new CodeGenerator();
        String code = gen.generate(ws);

        String expected = "digitalWrite(13, HIGH);\ndelay(1000);\n";
        Assert.assertEquals(expected, code);
    }

    @Test
    public void testNestedLoopCodeGeneration() {
        BlockDef loopDef = new BlockDef("loop", "Repeat", 0, List.of(new FieldDef("COUNT", "number", "5", null)), true, "DO", true, true, "for (int i = 0; i < %COUNT%; i++) {\n%DO%}\n");
        BlockDef delayDef = new BlockDef("delay", "Wait", 0, List.of(new FieldDef("MS", "number", "500", null)), false, null, true, true, "delay(%MS%);\n");

        Workspace ws = new Workspace();
        BlockInstance loopBlock = new BlockInstance(loopDef, 0, 0);
        BlockInstance childBlock = new BlockInstance(delayDef, 20, 40);

        loopBlock.statementChild = childBlock;
        childBlock.parentStatement = loopBlock;

        ws.addBlock(loopBlock);
        ws.addBlock(childBlock);

        CodeGenerator gen = new CodeGenerator();
        String code = gen.generate(ws);

        String expected = "for (int i = 0; i < 5; i++) {\n  delay(500);\n}\n";
        Assert.assertEquals(expected, code);
    }
}
