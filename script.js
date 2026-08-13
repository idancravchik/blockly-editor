//קטגוריות
const toolbox = {
  'kind': 'categoryToolbox',
  'contents': [
    {
      'kind': 'category',
      'name': 'כללי',
      'colour': '#dfea47',
      'contents': [
        { 'kind': 'block', 'type': 'number'},
        { 'kind': 'block', 'type': 'start'}

      ]
    },
    {
      'kind': 'category',
      'name': 'לוגיקה',
      'colour': '#5b975a', // צבע הקטגוריה בתפריט
      'contents': [
        { 'kind': 'block', 'type': 'if_then' },
        { 'kind': 'block', 'type': 'if_then_else'},
        { 'kind': 'block', 'type': 'compare'},
        { 'kind': 'block', 'type': 'delay'},
        { 'kind': 'block', 'type': 'repeat'}
        
      ]
    },
    {
      'kind': 'category',
      'name': 'מנועים',
      'colour': '#6DA3A4',
      'contents': [


      ]
    }
  ]
};
//בלוקים
Blockly.defineBlocksWithJsonArray([
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
  "colour": 210,
  "inputsInline": true
},
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
{
  "type": "delay",
  "tooltip": "",
  "helpUrl": "",
  "message0": "חכה %1 שניות %2",
  "args0": [
    {
      "type": "field_input",
      "name": "DELAY",
      "text": ""
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
      "text": ""
    },
    {
      "type": "input_dummy",
      "name": "REPEAT"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 210
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
    