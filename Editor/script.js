//קטגוריות
const toolbox = {
  'kind': 'categoryToolbox',
  'contents': [
    //זמזם
    {
      'kind': 'category',
      'name': 'זמזם',
      'colour': 15,
      'contents': [

      ]
    },
    //כללי
    {
      'kind': 'category',
      'name': 'כללי',
      'colour': 60,
      'contents': [
        { 'kind': 'block', 'type': 'start'},
        { 'kind': 'block', 'type': 'number'},
        { 'kind': 'block', 'type': 'compare'}

      ]
    },
    //כפתור
    {
      'kind': 'category',
      'name': 'כפתור',
      'colour': 120,
      'contents': [
        { 'kind': 'block', 'type': 'bt_pressed'},
        { 'kind': 'block', 'type': 'bt_is_pressed'}


      ]
    },
    //מנועים
    {
      'kind': 'category',
      'name': 'מנועים',
      'colour': 165,
      'contents': [
        { 'kind': 'block', 'type': 'servo_set_angle'},
        { 'kind': 'block', 'type': 'servo_get_angle'},
        { 'kind': 'block', 'type': 'servo_spin'}


      ]
    },
    //לוגיקה
    {
      'kind': 'category',
      'name': 'לוגיקה',
      'colour': 210, // צבע הקטגוריה בתפריט
      'contents': [
        { 'kind': 'block', 'type': 'if_then' },
        { 'kind': 'block', 'type': 'if_then_else'},
        { 'kind': 'block', 'type': 'delay'},
        { 'kind': 'block', 'type': 'repeat'},
        { 'kind': 'block', 'type': 'loop'}
        
      ]
    }

  ]
};

//בלוקים
Blockly.defineBlocksWithJsonArray([
//if_then
{
  "type": "if_then",
  "tooltip": "",
  "helpUrl": "",
  "message0": "אם %1 אז %2",
  "args0": [
    {
      "type": "input_value",
      "name": "Condition",
      "check": "Boolean"
    },
    {
      "type": "input_statement",
      "name": "DO"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 210
},
//if_then_else
{
  "type": "if_then_else",
  "tooltip": "",
  "helpUrl": "",
  "message0": "אם %1 אז %2 ואם לא אז %3",
  "args0": [
    {
      "type": "input_value",
      "name": "IF",
      "check": "Boolean"
    },
    {
      "type": "input_statement",
      "name": "DO"
    },
    {
      "type": "input_statement",
      "name": "ELSE"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 210
},
//compare
{
  "type": "compare",
  "tooltip": "",
  "helpUrl": "",
  "message0": "%1 %2 %3 %4",
  "args0": [
    {
      "type": "input_value",
      "name": "A"
    },
    {
      "type": "field_dropdown",
      "name": "NAME",
      "options": [
        [
          "=",
          "="
        ],
        [
          "<",
          "<"
        ],
        [
          ">",
          ">"
        ]
      ]
    },
    {
      "type": "input_dummy",
      "name": "NAME"
    },
    {
      "type": "input_value",
      "name": "NAME"
    }
  ],
  "output": "Boolean",
  "colour": 60,
  "inputsInline": true
},
//number
{
  "type": "number",
  "tooltip": "",
  "helpUrl": "",
  "message0": "%1 %2",
  "args0": [
    {
      "type": "field_number",
      "name": "NUMBER",
      "value": 0
    },
    {
      "type": "input_dummy",
      "name": "NUMBER"
    }
  ],
  "output": "Number",
  "colour": 60,
  "inputsInline": true
},
//start
{
  "type": "start",
  "tooltip": "",
  "helpUrl": "",
  "message0": "⬇️תתחילו כאן %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "start"
    }
  ],
  "nextStatement": null,
  "colour": 60,
  "inputsInline": true
},
//delay
{
  "type": "delay",
  "tooltip": "",
  "helpUrl": "",
  "message0": "חכה %1 שניות %2",
  "args0": [
    {
      "type": "field_input",
      "name": "DELAY",
      "text": "0"
    },
    {
      "type": "input_dummy",
      "name": "DELAY"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 210,
  "inputsInline": true
},
//repeat
{
  "type": "repeat",
  "tooltip": "",
  "helpUrl": "",
  "message0": "%1 תחזור על זה %2 ⬆️פעמים %3",
  "args0": [
    {
      "type": "input_statement",
      "name": "DO"
    },
    {
      "type": "field_input",
      "name": "REPEAT",
      "text": "0"
    },
    {
      "type": "input_dummy",
      "name": "REPEAT"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 210
},
//loop
{
  "type": "loop",
  "tooltip": "",
  "helpUrl": "",
  "message0": "%1 ⬆️תחזור על זה לנצח %2",
  "args0": [
    {
      "type": "input_statement",
      "name": "DO"
    },
    {
      "type": "input_dummy",
      "name": "LOOP"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 210
},
//servo_set_angle
{
  "type": "servo_set_angle",
  "tooltip": "",
  "helpUrl": "",
  "message0": "קבע זווית מנוע ל: %1 מעלות %2",
  "args0": [
    {
      "type": "field_input",
      "name": "DEGREES",
      "text": "0"
    },
    {
      "type": "input_dummy",
      "name": "DEGREES"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 165
},
//servo_get_angle
{
  "type": "servo_get_angle",
  "tooltip": "",
  "helpUrl": "",
  "message0": "זווית המנוע %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "DEGREES"
    }
  ],
  "output": "Number",
  "colour": 165
},
//servo_spin
{
  "type": "servo_spin",
  "tooltip": "",
  "helpUrl": "",
  "message0": "תסובב את המנוע %1 %2 %3",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "TYPE",
      "options": [
        [
          "רבע סיבוב",
          "QUARTER"
        ],
        [
          "חצי סיבוב",
          "HALF"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "DIR",
      "options": [
        [
          "🔃עם כיוון השעון",
          "CLOCKWISE"
        ],
        [
          "🔄️נגד כיוון השעון",
          "ANTICLOCKWISE"
        ]
      ]
    },
    {
      "type": "input_dummy",
      "name": "SPIN"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 165
},
//bt_pressed
{
  "type": "bt_pressed",
  "tooltip": "",
  "helpUrl": "",
  "message0": "לחצו על הכפתור %1 %2",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "TYPE",
      "options": [
        [
          "לחיצה רגילה",
          "PRESS"
        ],
        [
          "לחיצה כפולה",
          "DOUBLE"
        ],
        [
          "לחיצה ארוכה",
          "LONG"
        ]
      ]
    },
    {
      "type": "input_dummy",
      "name": "TYPE"
    }
  ],
  "output": "Boolean",
  "colour": 120
},
//bt_is_pressed
{
  "type": "bt_is_pressed",
  "tooltip": "",
  "helpUrl": "",
  "message0": "הכפתור %1 %2",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "IS",
      "options": [
        [
          "לחוץ",
          "YES"
        ],
        [
          "לא לחוץ",
          "NO"
        ]
      ]
    },
    {
      "type": "input_dummy",
      "name": "NOT"
    }
  ],
  "output": "Boolean",
  "colour": 120
}

]);


javascript.javascriptGenerator.forBlock['delay'] = function(block, generator) {
  const text_delay = block.getFieldValue('DELAY');

  // TODO: Assemble javascript into the code variable.
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



//הפעלה
const workspace = Blockly.inject('blocklyDiv', {
    toolbox: toolbox,
    rtl: true,
    renderer: 'zelos',
    zoom: {
        controls: true,
        wheel: false,
        startScale: 1.1, // 1.0 זה הגודל הרגיל, 1.2 זה 120%
        maxScale: 3,
        minScale: 0.3,
        scaleSpeed: 1.2
    },
    grid: {
    spacing: 20,
    length: 3,
    colour: '#ccc',
    snap: true         // מנחית בלוקים על נקודות הרשת
    }
    
    });

function updateCodeLive() {
  const code = javascript.javascriptGenerator.workspaceToCode(workspace);
  const outputElement = document.getElementById('codeOutput');
  if (outputElement) {
    outputElement.innerText = code || '// גרור בלוקים למסך...';
  }
}

workspace.addChangeListener(updateCodeLive);

updateCodeLive();