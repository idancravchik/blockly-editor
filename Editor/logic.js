javascript.javascriptGenerator.forBlock['delay'] = function(block, generator) {
  const text_delay = block.getFieldValue('DELAY');

  const code = 'delay(' + text_delay + ');\n';
  return code;
}

javascript.javascriptGenerator.forBlock['if_then'] = function(block, generator) {
  const condition = generator.valueToCode(block, 'Condition', javascript.javascriptGenerator.ORDER_NONE) || 'false';
  const doCode = generator.statementToCode(block, 'DO');
  const code = 'if (' + condition + ') {\n' + doCode + '}\n';
  return code;
};

javascript.javascriptGenerator.forBlock['if_then_else'] = function(block, generator) {
  const condition = generator.valueToCode(block, 'IF', javascript.javascriptGenerator.ORDER_NONE) || 'false';
  const doCode = generator.statementToCode(block, 'DO');
  const elseCode = generator.statementToCode(block, 'ELSE');
  const code = 'if (' + condition + ') {\n' + doCode + '} else {\n' + elseCode + '}\n';
  return code;
};

javascript.javascriptGenerator.forBlock['repeat'] = function(block, generator) {
    const times = block.getFieldValue('REPEAT');
    const doCode = generator.statementToCode(block, 'DO');
    const code = 'for (int i = 0; i<' + times + '; i++) {\n' + doCode + '\n}'
    return code;
}

javascript.javascriptGenerator.forBlock['loop'] = function(block, generator) {
  const doCode = generator.statementToCode(block, 'DO');
  const code = 'while (true) {\n' + doCode + '\n}'
  return code;
}

javascript.javascriptGenerator.forBlock['start'] = function(block, generator) {
  function generateCDefines(port1Module, port2Module) {
  const defines = [];

  function assignPins(moduleName, mainPin, secPin) {
    if (!moduleName) return; 
    

    switch (moduleName.toUpperCase()) {
      case 'SERVO':
        defines.push(`#define SERVO_PIN ${mainPin}\n`);
        break;
      case 'BUTTON':
        defines.push(`#define BUTTON_PIN ${mainPin}\n`);
        break;
      case 'BUZZER':
        defines.push(`#define BUZZER_PIN ${mainPin}\n`);
        break;
      case 'TEMPHUM':
        defines.push(`#define TEMPHUM_TX ${mainPin}\n`);
        defines.push(`#define TEMPHUM_RX ${secPin}\n`);
        break;
      case 'NONE':
      default:
        break;
    }
  }

  assignPins(port1Module, 15, 17);
  assignPins(port2Module, 14, 16);
  return defines.join('\n');
} //פונקציית עזר

const code = generateCDefines(block.getFieldValue('PORT1'), block.getFieldValue('PORT2'));
return code;

}