# 8051 Platform Laboratory Experiments

| Platform Details | Specification |
|---|---|
| **Microcontroller** | Atmel AT89S52 (MCS-51 Architecture) |
| **Clock Frequency** | 11.0592 MHz Quartz Crystal Oscillator |
| **Data Memory (RAM)** | 256 Bytes Internal Data RAM |
| **Program Memory (ROM)** | 8 KB In-System Programmable (ISP) Flash |
| **Peripherals Used** | GPIO Ports P0..P3, Timer 0 & 1, Hardware UART, External Interrupts |
| **External Interfacing** | ADC0804/0808, 16x2 HD44780 LCD, 4x4 Matrix Keypad, 7-Segment Displays |
| **Development Tools** | Keil uVision 5 (C51 v9.60), progisp172 ISP Flasher |

---

## Architecture & Memory Map

The AT89S52 features Harvard architecture with separate address spaces for program and data:
- **Internal RAM (00H - FFH):**
  - `00H - 1FH`: 4 Register Banks (Bank 0 - Bank 3, R0-R7).
  - `20H - 2FH`: Bit-addressable RAM (128 individual bit flags).
  - `30H - 7FH`: General-purpose scratchpad RAM.
  - `80H - FFH`: Special Function Registers (SFRs: P0..P3, TMOD, TCON, SBUF, SCON, IE, IP).
- **Program Memory:** 8 KB Flash starting at address `0000H` (Reset Vector at `0000H`).

---

## Experiment & Task Index

| CAT | Task Directory | Experiment Title | Hardware Peripherals | Status |
|---|---|---|---|---|
| **CAT2** | [TASK2B](CAT2/TASK2B) | Bare-Metal LED Blinking | P1.0, 330Ω Resistor, LED | PASSED |
| **CAT3** | [TASK3A](CAT3/TASK3A) | Multi-Pattern LED Sequencer & Button Controller | P3.0–P3.3 LEDs, P2.3 Button | PASSED |
| **CAT4** | [TASK4A](CAT4/TASK4A) | Matrix Keypad, 7-Segment, & LED HMI | P2 Keypad, P0 7-Seg, P3 LEDs | PASSED |
| **CAT5** | [TASK5A](CAT5/TASK5A) | Single-Channel ADC0804 Conversion | P1 (Data), P3.3–P3.5 Control | PASSED |
| **CAT5** | [TASK5B.1](CAT5/TASK5B/TASK5B.1) | Voltage Threshold Bar Graph | P1 ADC, P2.0–P2.3 Bar LEDs | PASSED |
| **CAT5** | [TASK5B.2](CAT5/TASK5B/TASK5B.2) | Continuous Sampling 7-Segment Output | P1 ADC, P0 Display, P2 Select | PASSED |
| **CAT5** | [TASK5B.3](CAT5/TASK5B/TASK5B.3) | LM35 Temperature Sensor Calibration | P1 ADC, LM35 Sensor (10mV/°C) | PASSED |
| **CAT5** | [TASK5C](CAT5/TASK5C) | Closed-Loop Threshold Alarm with Hysteresis | P1 ADC, P2.0 Alarm Actuator | PASSED |
| **CAT6** | [TASK6A](CAT6/TASK6A) | UART Initialization & String Transmission | P3.1 (TXD), Timer 1 Mode 2 | PASSED |
| **CAT6** | [TASK6B](CAT6/TASK6B) | UART Full-Duplex Character Echo | P3.0 (RXD), P3.1 (TXD), SBUF | PASSED |
| **CAT7** | [TASK7A](CAT7/TASK7A) | 16x2 HD44780 LCD 4-bit Initialization | P3.4–P3.7 Data, P3.2 RS, P3.3 E | PASSED |
| **CAT7** | [TASK7B](CAT7/TASK7B) | LCD Cursor Positioning & Dynamic Counter | 16x2 LCD, DDRAM Addressing | PASSED |
| **CAT7** | [TASK7C](CAT7/TASK7C) | Keypad 2D Character Navigation on LCD | 16x2 LCD, 4x4 Matrix Keypad | PASSED |

---

## Compilation & Flashing Instructions
1. Navigate to the task directory in Keil uVision: `8051/<CAT>/<TASK>/project.uvproj`.
2. Press `F7` to build target and generate Intel HEX output in `Objects/project.hex`.
3. Open `progisp172`, select `AT89S52`, load `Objects/project.hex`, and flash via ISP.
