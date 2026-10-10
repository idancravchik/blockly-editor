import os
import json

def main():
    root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    hex_a_path = os.path.join(root, 'firmware', 'demos', 'demo_serial_a.hex')
    hex_b_path = os.path.join(root, 'firmware', 'demos', 'demo_serial_b.hex')

    with open(hex_a_path, 'r', encoding='ascii') as f:
        hex_a = f.read()
    with open(hex_b_path, 'r', encoding='ascii') as f:
        hex_b = f.read()

    # 1. Update JS presets in web/js/demo-presets.js
    js_path = os.path.join(root, 'web', 'js', 'demo-presets.js')
    with open(js_path, 'w', encoding='utf-8') as f:
        f.write('// Precompiled CH552 USB CDC Serial firmwares (compiled by CH55xduino)\n')
        f.write('const DEMO_HEX_A = ' + json.dumps(hex_a) + ';\n')
        f.write('const DEMO_HEX_B = ' + json.dumps(hex_b) + ';\n')
    print(f'Wrote: {js_path}')

    # 2. Update Java presets in android/sample-app/src/main/java/com/devbox/sample/DemoHexPresets.java
    java_path = os.path.join(root, 'android', 'sample-app', 'src', 'main', 'java', 'com', 'devbox', 'sample', 'DemoHexPresets.java')
    
    def to_java(hex_content):
        lines = [line.strip() for line in hex_content.strip().splitlines() if line.strip()]
        return '\n'.join([f'            "{line}\\n" +' for line in lines[:-1]]) + f'\n            "{lines[-1]}\\n"'

    java_content = f'''package com.devbox.sample;

/**
 * Precompiled CH552 USB CDC Serial firmwares for instant hardware testing.
 * Sends 'A' and 'B' over USB Virtual COM port and Hardware UART0 every 1 second.
 */
public final class DemoHexPresets {{

    private DemoHexPresets() {{}}

    public static final String HEX_SEND_A =
{to_java(hex_a)};

    public static final String HEX_SEND_B =
{to_java(hex_b)};
}}
'''
    with open(java_path, 'w', encoding='utf-8') as f:
        f.write(java_content)
    print(f'Wrote: {java_path}')

if __name__ == '__main__':
    main()
