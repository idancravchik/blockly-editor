# Devbox V1

> **An ultra-low-cost, driverless physical computing kit and block programming platform powered by the WCH CH552G microcontroller.**

![Devbox V1 3D Assembly](docs/images/cad_assembly.png)

---

## 📌 Project Overview

**Devbox V1** is an all-in-one educational hardware and software ecosystem designed to make learning physical computing accessible, portable, and completely frictionless.

It features:
- **Custom Hardware:** A compact 30mm × 45mm custom PCB powered by the WCH CH552G 8051 USB microcontroller, housed in a custom 3D-printed snap/sliding enclosure.
- **Keyed Expansion Ports:** Dual 4-pin JST-PH 2.0mm keyed connectors (Port 1 & Port 2) preventing reversed polarity and eliminating loose breadboard jumper wires.
- **Zero-Driver WebHID Bootloader:** Custom-written C firmware running on the CH552 that flashes over standard USB HID. No Zadig, WinUSB, or vendor drivers are needed—works straight out of the box on school Chromebooks, Windows, Linux, and Android.
- **Visual Block Programming:** A custom Blockly-based web workspace (`webBlocks`) that converts graphical logic blocks into C / Arduino code.
- **Cloud Compilation Engine:** A stateless FastAPI backend (`API`) that runs `arduino-cli` with `CH55xDuino` to compile code on the fly and stream flashable binaries directly into the browser.

---

## 💡 Why I Made Devbox V1

Most beginner electronics platforms (Arduino Uno, ESP32, micro:bit) cost between $15 to $35+, and setting them up in classrooms or clubs is often frustrating. School laptops and Chromebooks frequently block serial driver installation (CH340/CP2102) and lack administrative permissions to configure COM ports or run native IDEs. Furthermore, delicate breadboards and messy jumper wires break constantly when transported.

I built Devbox V1 to solve this:
1. **Under $2 Total Bill of Materials:** The entire custom board costs less than $1.50 in components, making classroom sets affordable on any budget.
2. **Zero-Driver Plug & Play:** By engineering a custom USB HID bootloader, users can plug the device into any modern web browser (WebHID) and flash it in under a second with zero drivers or native software installation.
3. **Durable, Keyed Modularity:** Keyed JST-PH ports ensure students cannot plug sensors in backwards or short out power rails, protected inside a rugged 3D-printed enclosure.

---

## 📸 Project Pictures & Media

### 1. Full 3D CAD Assembly & Enclosure
The complete 3D CAD model showing the custom PCB seated inside the 3D-printed sliding case, with USB-C and expansion port cutouts:

![Devbox V1 3D Model](docs/images/cad_assembly.png)

*CAD files available in [`hardware/cad/board_enclosure.step`](hardware/cad/board_enclosure.step) (.STEP) and [`hardware/cad/board_enclosure.f3d`](hardware/cad/board_enclosure.f3d) (Fusion 360 source).*

---

### 2. Custom PCB Design & Schematic
The custom 30mm × 45mm 2-layer PCB designed in EasyEDA Pro, routing the CH552G MCU, decoupling capacitors, USB-C CC logic, and dual expansion headers:

| Schematic | PCB Layout & Silkscreen |
| :---: | :---: |
| ![Schematic](docs/images/schematic.png) | ![PCB Layout](docs/images/pcb_layout.png) |

*Full PCB production Gerbers are in [`hardware/pcb/gerbers.zip`](hardware/pcb/gerbers.zip) and EasyEDA Pro project in [`hardware/pcb/dev_box1.eprj`](hardware/pcb/dev_box1.eprj).*

---

### 3. Wiring & Pinout Architecture
Devbox V1 routes microcontroller pins to two standardized 4-pin expansion connectors:

![Devbox V1 Wiring Diagram](docs/images/wiring_diagram.svg)

| Port | Pin 1 | Pin 2 | Pin 3 (Main Signal) | Pin 4 (Secondary Signal) | Compatible Modules |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Port 1** | GND | 3.3V | **P1.5** (PWM / SDA) | **P1.7** (GPIO) | Servo Motor, Tactile Button, Buzzer, DHT11/22 |
| **Port 2** | GND | 3.3V | **P1.4** (GPIO / ADC) | **P1.6** (SCL) | Secondary Servo, LEDs, Digital Inputs, Sensors |

---

### 3. Modular Peripherals & Visual Blocks
The block interface allows drag-and-drop programming tailored specifically to Devbox V1's hardware modules:

![Modular Components](docs/images/modules_overview.png)

---

## 📂 Repository Layout

```text
DevboxV1/
├── BOM.csv                       # Bill of Materials with supplier links & unit costs
├── README.md                     # Main project documentation & grant overview
├── hardware/
│   ├── cad/
│   │   ├── board_enclosure.f3d   # Autodesk Fusion 360 parametric CAD source
│   │   └── board_enclosure.step  # Full 3D CAD assembly (PCB + enclosure)
│   └── pcb/
│       ├── dev_box1.eprj         # EasyEDA Pro project database & schematics
│       ├── gerbers.zip           # Production Gerber and NC drill files (JLCPCB ready)
│       ├── Info_PCB.txt          # Board specifications (30x45mm, 2 layers, 10 components)
│       └── schematic_dxf.zip     # DXF vector schematic export
├── HIDUploader/
│   ├── firmware/                 # CH552 USB HID Bootloader (SDCC C source & build)
│   │   ├── src/                  # bootloader.c, usb_hid.c, iap_flash.c
│   │   └── build/                # Compiled .hex and .bin bootloader images
│   ├── web/                      # WebHID browser flasher (HTML5 / Vanilla JS PWA)
│   ├── android/                  # Android native USB HID flasher app
│   └── python/                   # CLI cross-platform flasher utility
├── API/                          # Cloud compilation backend (FastAPI + arduino-cli)
└── webBlocks/                    # Blockly visual block programming frontend
```

---

## 🛠️ Bill of Materials (BOM) & Budget

The complete Bill of Materials encompasses the **core controller**, the **modular sensor ecosystem** (designed in EasyEDA Pro), **manufacturing tooling**, and **custom packaging** to ship complete kits.

*(See full machine-readable [`BOM.csv`](BOM.csv) in repository root with direct distributor part links)*

### 1. Devbox V1 Core Controller Board (5 Boards Prototype Batch)
| Component | Designator | Description | Qty | Supplier | Part # | Unit Price | Total |
| :--- | :--- | :--- | :---: | :--- | :--- | :---: | :---: |
| **MCU** | U1 | WCH CH552G 8051 USB MCU (SOP-16) | 5 | LCSC | [C111292](https://www.lcsc.com/product-detail/C111292.html) | $0.38 | $1.90 |
| **USB-C Port** | USB1 | USB Type-C 16-Pin SMD Receptacle | 5 | LCSC | [C5187472](https://www.lcsc.com/product-detail/C5187472.html) | $0.14 | $0.70 |
| **Expansion Ports** | U3, U4 | JST-PH 2.0mm 4-Pin Right Angle Header | 10 | LCSC | [C157926](https://www.lcsc.com/product-detail/C157926.html) | $0.10 | $1.00 |
| **Reset Switch** | SW3 | 5.1×5.1mm SMD Tactile Push Button | 5 | LCSC | [C318884](https://www.lcsc.com/product-detail/C318884.html) | $0.04 | $0.20 |
| **Capacitors** | C1, C2 | 100nF 50V X7R 0603 Ceramic Capacitor | 10 | LCSC | [C14663](https://www.lcsc.com/product-detail/C14663.html) | $0.01 | $0.10 |
| **Pull-Up Resistor** | R3 | 10kΩ 5% 0603 Thick Film Resistor | 5 | LCSC | [C98220](https://www.lcsc.com/product-detail/C98220.html) | $0.01 | $0.05 |
| **CC Resistors** | R4, R5 | 5.1kΩ 1% 0603 Type-C CC Pull-Down | 10 | LCSC | [C122969](https://www.lcsc.com/product-detail/C122969.html) | $0.01 | $0.10 |
| **Bare PCB** | PCB | Custom 2-Layer FR-4 (30×45mm, 5 pcs) | 5 | JLCPCB | [Custom PCB](https://jlcpcb.com) | $0.40 | $2.00 |
| **Subtotal (5 Core Boards)** | | | | | | | **$6.05** |

---

### 2. Modular Sensor & Peripheral Ecosystem (from EasyEDA Schematics)
| Module / Component | Designator | Description | Qty | Supplier | Part # | Unit Price | Total |
| :--- | :--- | :--- | :---: | :--- | :--- | :---: | :---: |
| **SHT40 Temp & Humidity** | U_SHT40 | Sensirion SHT40 Precision I2C Sensor IC | 5 | LCSC | [C54823945](https://www.lcsc.com/product-detail/C54823945.html) | $1.95 | $9.75 |
| **AHT20 Temp & Humidity** | U_AHT20 | ASAIR AHT20 Standard I2C Temp & Humidity | 5 | LCSC | [C2757850](https://www.lcsc.com/product-detail/C2757850.html) | $0.85 | $4.25 |
| **SC7A20 Accelerometer** | U_SC7A20 | Silan SC7A20HTR 3-Axis Motion Sensor | 5 | LCSC | [C19274408](https://www.lcsc.com/product-detail/C19274408.html) | $0.45 | $2.25 |
| **ATGM336H GPS / GNSS** | U_GPS | Zhongke Micro BDS/GPS Navigation Module | 2 | LCSC | [C90770](https://www.lcsc.com/product-detail/C90770.html) | $3.20 | $6.40 |
| **Piezo Buzzer** | BUZZER1 | MLT-8530 Electromagnetic SMD Buzzer | 5 | LCSC | [C94599](https://www.lcsc.com/product-detail/C94599.html) | $0.25 | $1.25 |
| **Buzzer Driver Transistor** | Q1 | S8050 NPN Transistor (SOT-23) | 5 | LCSC | [C916390](https://www.lcsc.com/product-detail/C916390.html) | $0.02 | $0.10 |
| **Flyback Diode** | D1 | 1N4148W High-Speed Diode (SOD-123) | 5 | LCSC | [C917030](https://www.lcsc.com/product-detail/C917030.html) | $0.02 | $0.10 |
| **RGB NeoPixel LED** | LED1 | SK6812 5050 Addressable RGB LED | 10 | LCSC | [C2765348](https://www.lcsc.com/product-detail/C2765348.html) | $0.08 | $0.80 |
| **Big Key Switch** | KEY1 | B3F-4055 12×12mm Tactile Button | 5 | LCSC | [C84931](https://www.lcsc.com/product-detail/C84931.html) | $0.15 | $0.75 |
| **JST Sensor Headers** | CN_SENS | JST-PH 2.0mm 4-Pin Straight Male Header | 15 | LCSC | [C131334](https://www.lcsc.com/product-detail/C131334.html) | $0.08 | $1.20 |
| **Sensor Breakout PCBs** | PCB_SENS | Panelized 2-Layer Sensor Breakout Batch | 5 | JLCPCB | [Custom Breakouts](https://jlcpcb.com) | $1.00 | $5.00 |
| **Subtotal (Sensor Boards)** | | | | | | | **$31.85** |

---

### 3. Assembly Tooling & Prototyping
| Tool / Material | Description | Qty | Supplier | Unit Price | Total |
| :--- | :--- | :---: | :--- | :---: | :---: |
| **SMD Soldering Stencil** | Stainless steel electropolished frameless SMT stencil for solder paste application | 1 | [JLCPCB Stencil](https://jlcpcb.com/smt-stencil) | $7.00 | $7.00 |
| **WCH-LinkE Programmer** | USB ISP / SWD debugger & programmer for flashing blank CH552 MCUs | 1 | [AliExpress / WCH](https://www.aliexpress.com/item/1005004815454659.html) | $4.80 | $4.80 |
| **PETG 3D Printing Filament** | 1.75mm 1kg spool for printing durable, heat-resistant sliding enclosures | 1 | [Amazon](https://www.amazon.com/dp/B07PGZNM34) | $16.99 | $16.99 |
| **Subtotal (Tooling)** | | | | | **$28.79** |

---

### 4. Custom Packaging & Kit Fulfillment
| Packaging Item | Description | Qty | Supplier | Unit Price | Total |
| :--- | :--- | :---: | :--- | :---: | :---: |
| **Custom Kraft Cardboard Boxes** | 50×50×100mm rigid folding kraft kit boxes (20-pack) | 1 pack | [Amazon](https://www.amazon.com/dp/B08M9J8V1G) | $14.50 | $14.50 |
| **Anti-Static ESD Shielding Bags** | Translucent ESD ziplock protective bags for boards & sensors (50-pack) | 1 pack | [Amazon](https://www.amazon.com/dp/B07P7QG69N) | $7.99 | $7.99 |
| **Custom Branding Stickers** | Die-cut vinyl logo stickers for enclosure & kit box branding (50-pack) | 1 pack | [StickerMule](https://www.stickermule.com/custom-stickers) | $9.00 | $9.00 |
| **Subtotal (Packaging)** | | | | | **$31.49** |

---

### 💰 Grand Total Budget
$$\mathbf{\$6.05} \text{ (5 Controllers)} + \mathbf{\$31.85} \text{ (Sensors)} + \mathbf{\$28.79} \text{ (Tooling)} + \mathbf{\$31.49} \text{ (Packaging)} = \mathbf{\$98.18}$$

*(A complete, self-contained educational classroom kit run under $100)*

---

## 📜 License
Devbox V1 hardware and firmware are open-source under the GNU General Public License v3.0 (see [LICENSE](LICENSE)).
