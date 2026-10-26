import * as Blockly from 'blockly';
import './index.css';
import blocks from './blocks.json';
import toolbox from './toolbox.json';
import { cGenerator } from './generator';

// Register blocks from JSON
Blockly.common.defineBlocksWithJsonArray(blocks);

// Inject Blockly workspace
const blocklyDiv = document.getElementById('blocklyDiv');
const ws = Blockly.inject(blocklyDiv, { 
    toolbox,
    rtl: true,
    renderer: 'zelos',
    horizontalLayout: true,
    toolboxPosition: 'end'
 });

// Button opens standard alert() with generated code
document.getElementById('alertBtn').addEventListener('click', () => {
  const code = cGenerator.workspaceToCode(ws);
  alert(code || 'No blocks in workspace');
});

window.addEventListener('resize', () => Blockly.svgResize(ws));
