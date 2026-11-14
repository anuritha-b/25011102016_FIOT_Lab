# CAT7 – 16×2 LCD Driver Development and Dynamic Display Control

## EXP
CAT7

## DATE
24/08/2026

## NAME OF EXP
16×2 LCD Driver Development and Dynamic Display Control

## HARDWARE SETUP / PLATFORM
- **Development Board:** 8051 Development Board
- **Microcontroller:** AT89S52
- **Display:** 16×2 HD44780-compatible Character LCD
- **Input Device:** 4×4 Matrix Keypad (Task 3)
- **LCD Interface:** 4-bit GPIO-based interface
- **LCD Data Pins:** P3.4–P3.7
- **LCD Enable Pin (E):** P3.3
- **LCD Register Select (RS):** P3.2
- **Keypad Pins:** P2.7, P2.6, P2.2, P2.3 and P2.1
- **Programming Language:** Embedded C
- **Development Environment:** Keil µVision

## TASK NO

This experiment consists of three tasks:

### Task 1 – LCD Initialization and Character/String Display

Develop a 4-bit GPIO-based LCD driver and configure the 16×2 LCD for 4-bit, 2-line operation. Display character and string data.

### Task 2 – Cursor Positioning and Dynamic Value Update

Develop cursor-positioning and data-update functions, including `lcd_goto()`, `lcd_puts()` and `lcd_print_number()`.

### Task 3 – 4×4 Keypad-Based Character Movement

Develop an interactive application in which a character is moved across the 16×2 LCD using keypad directional inputs.

## Circuit Diagram

![Circuit Diagram](circuit.png)


**Common LCD Connections:**

| AT89S52 Pin | LCD Pin |
|---|---|
| P3.4 | D4 |
| P3.5 | D5 |
| P3.6 | D6 |
| P3.7 | D7 |
| P3.3 | E |
| P3.2 | RS |

```text
              AT89S52 (8051)                      16x2 HD44780 LCD
          +--------------------+               +--------------------+
          |      P3.2 (Pin 12) |-------------->| RS (Pin 4)
          |      P3.3 (Pin 13) |-------------->| E  (Pin 6)
          |      P3.4 (Pin 14) |-------------->| D4 (Pin 11)
          |      P3.5 (Pin 15) |-------------->| D5 (Pin 12)
          |      P3.6 (Pin 16) |-------------->| D6 (Pin 13)
          |      P3.7 (Pin 17) |-------------->| D7 (Pin 14)
          |                GND |-------------->| RW, VSS, K (GND)
          |               +5V  |-------------->| VDD, A (+5V)
          +--------------------+               +--------------------+
```

## Core Logic / Pseudocode / Code Base

### Task 1 – LCD Initialization and Character/String Display

- Configure the LCD interface using GPIO pins.
- Send initialization commands to configure the LCD.
- Configure display ON, cursor ON and cursor increment.
- Clear the display.
- Transmit character data using the LCD data pins.

### Task 2 – Cursor Positioning and Dynamic Value Update

- Initialize the LCD.
- Implement functions to send commands and character data.
- Calculate DDRAM addresses for cursor positioning.
- Display strings character by character.
- Convert integer values into individual decimal digits and display them.

### Task 3 – 4×4 Keypad-Based Character Movement

- Initialize the LCD.
- Display the character `A` at the initial position (row 1, column 1).
- Scan keypad inputs continuously.
- Identify the selected direction.
- Erase the character from its current position.
- Update the row or column.
- Display the character at its new position.
- Prevent movement outside the LCD boundaries.

**Overall Pseudocode:**

```text
START

1. Initialize the 8051 GPIO interface.
2. Initialize the 16×2 LCD in 4-bit mode.

3. Perform the selected task:

   TASK 1:
      Configure LCD display settings.
      Clear the display.
      Transmit character data.

   TASK 2:
      Implement LCD command and data functions.
      Position cursor using DDRAM addresses.
      Display strings and integer values.
      Update display contents.

   TASK 3:
      Initialize the keypad.
      Display character 'A' at the initial position.
      Continuously scan keypad inputs.
      Update character position according to direction.
      Maintain LCD row and column boundaries.

END
```

**Source Code:** `main.c`

## INFERENCE

The experiment demonstrates the interfacing and control of a 16×2 HD44780-compatible character LCD using the AT89S52 microcontroller.

It covers LCD initialization, 4-bit data communication, command and character transmission, DDRAM-based cursor positioning, string and integer display, and dynamic display updates.

The keypad-based movement task further demonstrates how GPIO inputs can be used to control the position of a character on an LCD.

Overall, the experiment provides practical experience in reading peripheral datasheets, deriving command sequences, developing low-level Embedded C drivers and interfacing external peripherals with an 8051 microcontroller.
