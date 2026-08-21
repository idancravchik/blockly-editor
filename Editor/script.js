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
        { 'kind': 'block', 'type': 'bz_on'},
        { 'kind': 'block', 'type': 'bz_off'},
        { 'kind': 'block', 'type': 'bz_sound'}

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
        { 'kind': 'block', 'type': 'compare'},
        { 'kind': 'block', 'type': 'delay'},

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
        { 'kind': 'block', 'type': 'repeat'},
        { 'kind': 'block', 'type': 'loop'}
        
      ]
    },
    //מזג אוויר
    {
      'kind': 'category',
      'name': 'מזג אוויר',
      'colour': 225, // צבע הקטגוריה בתפריט
      'contents': [
        { 'kind': 'block', 'type': 'temperature' },
        { 'kind': 'block', 'type': 'humidity'},

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
      "type": "field_number",
      "name": "B"
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
  "message0": "התחל כאן ⬇️ חיבור 1️⃣ %1 חיבור 2️⃣ %2 %3",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "PORT1",
      "options": [
        [
          "כלום ❌",
          "NONE"
        ],
        [
          "מנוע 🔁",
          "SERVO"
        ],
        [
          "כפתור ▶️",
          "BUTTON"
        ],
        [
          "זמזם 🔊",
          "BUZZER"
        ],
        [
          "חיישן מזג אוויר 🌦️",
          "TEMPHUM"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "PORT2",
      "options": [
        [
          "כלום ❌",
          "NONE"
        ],
        [
          "מנוע 🔁",
          "SERVO"
        ],
        [
          "כפתור ▶️",
          "BUTTON"
        ],
        [
          "זמזם 🔊",
          "BUZZER"
        ],
        [
          "חיישן מזג אוויר 🌦️",
          "TEMPHUM"
        ]
      ]
    },
    {
      "type": "input_dummy",
      "name": "PORTS"
    }
  ],
  "nextStatement": null,
  "colour": 60
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
  "colour": 60,
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
},
//bz_on
{
  "type": "bz_on",
  "tooltip": "",
  "helpUrl": "",
  "message0": "תפעיל את הזמזם %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "DELAY"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 15
},
//bz_off
{
  "type": "bz_off",
  "tooltip": "",
  "helpUrl": "",
  "message0": "תכבה את הזמזם %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "BZ"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 15
},
//bz_sound
{
  "type": "bz_sound",
  "tooltip": "",
  "helpUrl": "",
  "message0": "הפעל צליל של %1 %2",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "TYPE",
      "options": [
        [
          "⏰התראה",
          "alarm"
        ],
        [
          "🚨אזעקה",
          "siren"
        ],
        [
          "🥳יום הולדת",
          "birthday"
        ],
        [
          "🏆ניצחון",
          "success"
        ]
      ]
    },
    {
      "type": "input_dummy",
      "name": "BZ"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 15
},
//temperature
{
  "type": "temperature",
  "tooltip": "",
  "helpUrl": "",
  "message0": "טמפרטורה נוכחית %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "TEMP"
    }
  ],
  "output": "Number",
  "colour": 225
},
//לחות
{
  "type": "humidity",
  "tooltip": "",
  "helpUrl": "",
  "message0": "לחות נוכחית %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "HUM"
    }
  ],
  "output": "Number",
  "colour": 225
}
                    
                    
                    
]);

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
const startBlock = workspace.newBlock('start');
startBlock.initSvg();
startBlock.render();
workspace.centerOnBlock(startBlock.id);
startBlock.moveBy(0, -200);
startBlock.setDeletable(false);
function updateCodeLive() {
  const code = javascript.javascriptGenerator.workspaceToCode(workspace);
  const outputElement = document.getElementById('codeOutput');
  if (outputElement) {
    outputElement.innerText = code || '// גרור בלוקים למסך...';
  }
}
workspace.addChangeListener(updateCodeLive);
updateCodeLive();