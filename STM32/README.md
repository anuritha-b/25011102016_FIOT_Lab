# STM32 Platform Laboratory Experiments

| Platform Details | Specification |
|---|---|
| **Cores Used** | ARM Cortex-M3 (STM32F103C8T6), ARM Cortex-M4 (STM32F401RET6, STM32F410RBT6) |
| **Clock Speeds** | 72 MHz (F103), 84 MHz (F401RE), 100 MHz (F410RB) |
| **Toolchains** | STM32CubeMX, Keil MDK-ARM v5, STM32 HAL Library |
| **Peripherals Used** | GPIO, SysTick, USART1/2, I2C1, EXTI, NVIC |
| **IoT / Edge Devices** | Wemos D1 Mini / ESP8266 (Wi-Fi), Bosch BME280 (I2C Environmental Sensor) |
| **Protocols & Stacks** | UART AT Command Protocol, TCP/IP, HTTP/1.1 Web Server, MQTT 3.1.1 |

---

## Architectural Overview

The STM32 experiments leverage the official STMicroelectronics Hardware Abstraction Layer (HAL):
- **Clock Tree Configuration:** Configured using HSE external oscillators (or bypass mode on Nucleo boards) and phase-locked loop (PLL) multipliers.
- **Modem Subsystem:** The STM32 interfaces with an ESP8266 coprocessor via USART1 (115200 baud, 8N1). AT commands govern Wi-Fi station association, multi-connection TCP socket allocation, and HTTP server listeners.
- **Sensor Subsystem:** Interfaced via I2C1 at 100 kHz standard mode with Bosch Sensortec compensation algorithms.
- **Telemetry Engine:** Custom lightweight JSON formatting and binary MQTT packet transmission to cloud message brokers.

---

## Experiment & Task Index

| CAT | Task Directory | Experiment Title | Hardware Components | Status |
|---|---|---|---|---|
| **CAT8** | [TASK8A](CAT8/TASK8A) | GPIO Direct Polling Control | Blue Pill, PB10 (LED), PB12 (Button) | PASSED |
| **CAT8** | [TASK8B](CAT8/TASK8B) | Debounced Edge Trigger Toggle | Blue Pill, PB10, PB12 Debounced | PASSED |
| **CAT8** | [TASK8C](CAT8/TASK8C) | Short Press vs. Long Press Detection | Blue Pill, Tick-based Duration | PASSED |
| **CAT9** | [TASK9A](CAT9/TASK9A) | USART1 String Transmission | Blue Pill, PA9 (TX), PA10 (RX) | PASSED |
| **CAT9** | [TASK9B](CAT9/TASK9B) | Command Interpreter & Echo | Blue Pill, USART1, PB10 Actuator | PASSED |
| **CAT10** | [TASK10A](CAT10/TASK10A) | STM32-ESP8266 AT Synchronization | Blue Pill + Wemos D1, USART1/2 | PASSED |
| **CAT10** | [TASK10B](CAT10/TASK10B) | Wi-Fi Station Association & IP Query | Blue Pill + ESP8266, AT+CWJAP | PASSED |
| **CAT10** | [TASK10C](CAT10/TASK10C) | Multi-Connection TCP Server Setup | Blue Pill + ESP8266, Port 80 | PASSED |
| **CAT11** | [TASK11A](CAT11/TASK11A) | Asynchronous +IPD Frame Parsing | Nucleo-F410RB + ESP8266 | PASSED |
| **CAT11** | [TASK11B](CAT11/TASK11B) | Two-Step HTTP Response Engine | Nucleo-F410RB, Web Browser / Node-RED | PASSED |
| **CAT12** | [TASK12A](CAT12/TASK12A) | Nucleo-F401RE LD2 Precision Blink | Nucleo-F401RE, PA5 LED (1 Hz) | PASSED |
| **CAT12** | [TASK12B](CAT12/TASK12B) | User Button B1 State Retention | Nucleo-F401RE, PC13 Button, PA5 LED | PASSED |
| **CAT12** | [TASK12C](CAT12/TASK12C) | Multi-Gesture Strobe Mode | Nucleo-F401RE, Duration Discrimination | PASSED |
| **CAT13** | [TASK13](CAT13/TASK13) | Bosch BME280 Sensor Interfacing | Nucleo-F410RB, BME280 (I2C1), USART2 | PASSED |
| **CAT14** | [TASK14](CAT14/TASK14) | Cloud MQTT Environmental Telemetry | Nucleo-F410RB + BME280 + ESP8266 | PASSED |

---

## Compilation & Flashing Instructions
1. Open the MDK-ARM project: `STM32/<CAT>/<TASK>/MDK-ARM/project.uvprojx`.
2. Ensure ST-Link is connected via USB.
3. Build the firmware (`F7`).
4. Click `Download` (`F8`) to program flash memory.
5. Open a serial terminal on the ST-Link Virtual COM Port at 115200 baud to view debug telemetries.
