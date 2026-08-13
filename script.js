const toolbox = {
  'kind': 'categoryToolbox',
  'contents': [
    {
      'kind': 'category',
      'name': 'לוגיקה',
      'colour': '#5b975a', // צבע הקטגוריה בתפריט
      'contents': [
        { 'kind': 'block', 'type': 'if_then' },
        { 'kind': 'block', 'type': 'if_then_else'},
        { 'kind': 'block', 'type': 'logic_compare' }
        
      ]
    },
    {
      'kind': 'category',
      'name': 'מנועים',
      'colour': '#6DA3A4',
      'contents': [
        { 'kind': 'block', 'type': 'motor_speed' },
        { 'kind': 'block', 'type': 'motor_on' },
        { 'kind': 'block', 'type': 'motor_off' },
        { 'kind': 'block', 'type': 'if_motor_on'}

      ]
    }
  ]
};
Blockly.defineBlocksWithJsonArray([
  {
  "type": "motor_speed",
  "tooltip": "",
  "helpUrl": "",
  "message0": "קבע מהירות מנוע ל %1 %2",
  "args0": [
    {
      "type": "field_number",
      "name": "speed",
      "value": 0,
      "min": 0
    },
    {
      "type": "input_dummy",
      "name": "speed"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 165
},
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
  "type": "motor_on",
  "tooltip": "",
  "helpUrl": "",
  "message0": "תפעיל את המנוע %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "ON"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 165
},
{
  "type": "motor_off",
  "tooltip": "",
  "helpUrl": "",
  "message0": "תכבה את המנוע %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "OFF"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 165
},
{
  "type": "if_motor_on",
  "tooltip": "",
  "helpUrl": "",
  "message0": "המנוע דלוק %1",
  "args0": [
    {
      "type": "input_dummy",
      "name": "OFF"
    }
  ],
  "output": "Boolean",
  "colour": 165
}
                    
                    
]);

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