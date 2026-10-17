// === השהיה (Delay) ===
javascript.javascriptGenerator.forBlock['delay'] = function(block, generator) {
  const text_delay = block.getFieldValue('DELAY') || '0';
  const delaySec = parseFloat(text_delay);
  const delayMs = isNaN(delaySec) ? 0 : Math.round(delaySec * 1000);
  return `delay(${delayMs});\n`;
};

// === התנאי if_then ===
javascript.javascriptGenerator.forBlock['if_then'] = function(block, generator) {
  const condition = generator.valueToCode(block, 'Condition', javascript.javascriptGenerator.ORDER_NONE) || 'false';
  const doCode = generator.statementToCode(block, 'DO');
  return `if (${condition}) {\n${doCode}}\n`;
};

// === התנאי if_then_else ===
javascript.javascriptGenerator.forBlock['if_then_else'] = function(block, generator) {
  const condition = generator.valueToCode(block, 'IF', javascript.javascriptGenerator.ORDER_NONE) || 'false';
  const doCode = generator.statementToCode(block, 'DO');
  const elseCode = generator.statementToCode(block, 'ELSE');
  return `if (${condition}) {\n${doCode}} else {\n${elseCode}}\n`;
};

// === חזרה על פעולה (Repeat) ===
javascript.javascriptGenerator.forBlock['repeat'] = function(block, generator) {
  const times = block.getFieldValue('REPEAT') || '0';
  const doCode = generator.statementToCode(block, 'DO');
  return `for (int i = 0; i < ${times}; i++) {\n${doCode}}\n`;
};

// === לולאה אינסופית (Loop) ===
javascript.javascriptGenerator.forBlock['loop'] = function(block, generator) {
  const doCode = generator.statementToCode(block, 'DO');
  return `while (true) {\n${doCode}}\n`;
};

// === מספר (Number) ===
javascript.javascriptGenerator.forBlock['number'] = function(block, generator) {
  const number = block.getFieldValue('NUMBER') || '0';
  return [number, javascript.javascriptGenerator.ORDER_ATOMIC];
};

// === השוואה (Compare) ===
javascript.javascriptGenerator.forBlock['compare'] = function(block, generator) {
  const a = generator.valueToCode(block, 'A', javascript.javascriptGenerator.ORDER_RELATIONAL) || '0';
  const op = block.getFieldValue('NAME') || '=';
  const b = block.getFieldValue('B') || '0';
  const cOp = (op === '=') ? '==' : op;
  return [`(${a} ${cOp} ${b})`, javascript.javascriptGenerator.ORDER_RELATIONAL];
};

// === התחלה / אתחול (Start) ===
javascript.javascriptGenerator.forBlock['start'] = function(block, generator) {
  const p1 = block.getFieldValue('PORT1');
  const p2 = block.getFieldValue('PORT2');

  function configurePort(moduleName, mainPin, secPin) {
    if (!moduleName || moduleName === 'NONE') return;

    switch (moduleName.toUpperCase()) {
      case 'SERVO':
        generator.definitions_['def_servo'] = `#define SERVO_PIN ${mainPin}`;
        generator.setups_['setup_servo'] = `pinMode(SERVO_PIN, OUTPUT);`;
        break;
      case 'BUTTON':
        generator.definitions_['def_btn'] = `#define BUTTON_PIN ${mainPin}`;
        generator.setups_['setup_btn'] = `pinMode(BUTTON_PIN, INPUT);`;
        break;
      case 'BUZZER':
        generator.definitions_['def_bz'] = `#define BUZZER_PIN ${mainPin}`;
        generator.setups_['setup_bz'] = `pinMode(BUZZER_PIN, OUTPUT);`;
        break;
      case 'TEMPHUM':
        generator.definitions_['def_temphum'] = `#define TEMPHUM_TX ${mainPin}\n#define TEMPHUM_RX ${secPin}`;
        generator.setups_['setup_temphum'] = `// DHT setup`;
        break;
    }
  }

  configurePort(p1, 15, 17);
  configurePort(p2, 14, 16);

  return '';
};

// === זמזם - הפעלה (bz_on) ===
javascript.javascriptGenerator.forBlock['bz_on'] = function(block, generator) {
  return `digitalWrite(BUZZER_PIN, HIGH);\n`;
};

// === זמזם - כיבוי (bz_off) ===
javascript.javascriptGenerator.forBlock['bz_off'] = function(block, generator) {
  return `digitalWrite(BUZZER_PIN, LOW);\n`;
};

// === זמזם - צליל (bz_sound) ===
javascript.javascriptGenerator.forBlock['bz_sound'] = function(block, generator) {
  const type = block.getFieldValue('TYPE') || 'alarm';
  return `playBuzzerSound("${type}");\n`;
};

// === כפתור - בדיקת לחיצה (bt_pressed) ===
javascript.javascriptGenerator.forBlock['bt_pressed'] = function(block, generator) {
  return [`(digitalRead(BUTTON_PIN) == HIGH)`, javascript.javascriptGenerator.ORDER_RELATIONAL];
};

// === כפתור - האם לחוץ (bt_is_pressed) ===
javascript.javascriptGenerator.forBlock['bt_is_pressed'] = function(block, generator) {
  const is = block.getFieldValue('IS') || 'YES';
  const check = (is === 'YES') ? 'HIGH' : 'LOW';
  return [`(digitalRead(BUTTON_PIN) == ${check})`, javascript.javascriptGenerator.ORDER_RELATIONAL];
};

// === מנוע סרוו - קביעת זווית (servo_set_angle) ===
javascript.javascriptGenerator.forBlock['servo_set_angle'] = function(block, generator) {
  const degrees = block.getFieldValue('DEGREES') || '0';
  return `setServoAngle(${degrees});\n`;
};

// === מנוע סרוו - קריאת זווית (servo_get_angle) ===
javascript.javascriptGenerator.forBlock['servo_get_angle'] = function(block, generator) {
  return [`getServoAngle()`, javascript.javascriptGenerator.ORDER_FUNCTION_CALL];
};

// === מנוע סרוו - סיבוב (servo_spin) ===
javascript.javascriptGenerator.forBlock['servo_spin'] = function(block, generator) {
  const type = block.getFieldValue('TYPE') || 'QUARTER';
  const dir = block.getFieldValue('DIR') || 'CLOCKWISE';
  return `servoSpin("${type}", "${dir}");\n`;
};

// === מזג אוויר - טמפרטורה (temperature) ===
javascript.javascriptGenerator.forBlock['temperature'] = function(block, generator) {
  return [`readTemperature()`, javascript.javascriptGenerator.ORDER_FUNCTION_CALL];
};

// === מזג אוויר - לחות (humidity) ===
javascript.javascriptGenerator.forBlock['humidity'] = function(block, generator) {
  return [`readHumidity()`, javascript.javascriptGenerator.ORDER_FUNCTION_CALL];
};

// === סריאל - הדפסת שורה (serial_println) ===
javascript.javascriptGenerator.forBlock['serial_println'] = function(block, generator) {
  const text = generator.valueToCode(block, 'TEXT', javascript.javascriptGenerator.ORDER_NONE) || '""';
  return `USBSerial_println(${text});\n`;
};

// === סריאל - הדפסה (serial_print) ===
javascript.javascriptGenerator.forBlock['serial_print'] = function(block, generator) {
  const text = generator.valueToCode(block, 'TEXT', javascript.javascriptGenerator.ORDER_NONE) || '""';
  return `USBSerial_print(${text});\n`;
};

// === טקסט חופשי (text) ===
javascript.javascriptGenerator.forBlock['text'] = function(block, generator) {
  const text = block.getFieldValue('TEXT') || '';
  return [`"${text}"`, javascript.javascriptGenerator.ORDER_ATOMIC];
};

// === סריאל - קריאת תו (serial_read) ===
javascript.javascriptGenerator.forBlock['serial_read'] = function(block, generator) {
  return [`USBSerial_read()`, javascript.javascriptGenerator.ORDER_FUNCTION_CALL];
};

// === סריאל - בדיקת זמינות (serial_available) ===
javascript.javascriptGenerator.forBlock['serial_available'] = function(block, generator) {
  return [`(USBSerial_available() > 0)`, javascript.javascriptGenerator.ORDER_RELATIONAL];
};