# CAT13 – BME280 Sensor Interfacing Using I²C and Bosch Sensor API

## EXP
CAT13

## DATE
23/10/2026

## NAME OF EXP
BME280 Sensor Interfacing Using I²C and Bosch Sensor API

## HARDWARE SETUP / PLATFORM
- **Development Board:** NUCLEO-F410RB
- **Microcontroller:** STM32F410RBT6
- **Processor Core:** ARM Cortex-M4
- **Sensor:** Bosch BME280 Environmental Sensor
- **Communication Protocol:** I²C (I²C1)
- **Serial Communication:** USART2
- **Debugging / Serial Interface:** ST-Link Virtual COM Port
- **Software Tools:** STM32CubeMX, Keil MDK, Arduino IDE Serial Monitor
- **Libraries:** STM32 HAL Library and Bosch Sensortec BME280 Sensor API

## TASK NO
Task 1 – BME280 Sensor Interfacing Using I²C and Bosch Sensor API

## Circuit Diagram

![Circuit Diagram](circuit.png)


```text
          STM32F410RB (Nucleo)                       Bosch BME280 Sensor
          +------------------------+                +--------------------+
          |          PB8 (I2C1 SCL)|--------------->| SCL (Pin)
          |          PB9 (I2C1 SDA)|<-------------->| SDA (Pin)
          |                   3.3V |--------------->| VCC (3.3V)
          |                    GND |----------------| GND
          |                        |                | I2C Address: 0x76
          |         PA2 (USART2 TX)|---> PC Monitor +--------------------+
          +------------------------+     (Compensated T, P, H Data Stream)
```

The BME280 sensor is interfaced with the STM32F410RBT6 using the I²C1 peripheral.

The connections include:
- BME280 VCC → 3.3V supply
- BME280 GND → GND
- BME280 SDA → STM32 I²C1 SDA pin
- BME280 SCL → STM32 I²C1 SCL pin

The sensor's I²C address is configured as `0x76` using `BME280_I2C_ADDR_PRIM`.

USART2 is used to transmit the measured sensor values to the PC through the board's ST-Link Virtual COM Port.

## Core Logic / Pseudocode / Code Base

The application interfaces the BME280 environmental sensor with the STM32 microcontroller using the I²C communication protocol. The Bosch Sensortec BME280 Sensor API is used to initialise the sensor, configure its measurement settings, read sensor data, and apply the built-in compensation algorithms.

### Pseudocode

**1. Initialisation**
1. Initialise the STM32 HAL library.
2. Configure the system clock.
3. Initialise GPIO, I²C1, and USART2 peripherals.
4. Set the BME280 I²C address to `0x76`.
5. Configure the Bosch API interface structure with custom I²C read/write functions.
6. Initialise the BME280 sensor using `bme280_init()`.

**2. Sensor Configuration**
1. Configure temperature oversampling to 1×.
2. Configure pressure oversampling to 1×.
3. Configure humidity oversampling to 1×.
4. Disable the internal filter.
5. Apply configuration using `bme280_set_sensor_settings()`.
6. Set the sensor to normal operating mode using `bme280_set_sensor_mode()`.

**3. Measurement and Data Transmission**
1. Read temperature, pressure, and humidity using `bme280_get_sensor_data()`.
2. Extract compensated measurements: Temperature (°C), Pressure (hPa), Humidity (%RH).
3. Format measurements using `sprintf()`.
4. Transmit through USART2 using `HAL_UART_Transmit()`.
5. Wait one second and repeat.

### Important Functions Used

| Function | Purpose |
|---|---|
| `bme280_init()` | Initialises the BME280 sensor and reads calibration data. |
| `bme280_set_sensor_settings()` | Configures oversampling and filter settings. |
| `bme280_set_sensor_mode()` | Sets the sensor operating mode. |
| `bme280_get_sensor_data()` | Reads compensated temperature, pressure, and humidity. |
| `user_i2c_read()` | Reads BME280 registers using STM32 HAL I²C. |
| `user_i2c_write()` | Writes to BME280 registers using STM32 HAL I²C. |
| `HAL_UART_Transmit()` | Transmits formatted sensor measurements to the PC. |

### Code Base
- `Core/Src/main.c` – Application source code.
- `bme280.c` – Bosch BME280 Sensor API implementation.
- `bme280.h` – Bosch BME280 API function declarations and structures.
- `bme280_defs.h` – BME280 register definitions, constants, and configuration macros.
- `.ioc` – STM32CubeMX configuration file.

## INFERENCE

The BME280 environmental sensor was interfaced with the STM32F410RBT6 microcontroller using the I²C1 communication protocol and the Bosch Sensortec BME280 Sensor API.

The sensor was initialised and configured with 1× oversampling for temperature, pressure, and humidity measurements, with the internal filter disabled. The Bosch API performed the compensation calculations using the sensor's calibration data.

The measured values were periodically transmitted through USART2 using the ST-Link Virtual COM Port and displayed on the Arduino IDE Serial Monitor.

This experiment demonstrated sensor interfacing using I²C, integration of an external sensor driver with STM32 HAL, compensated environmental data acquisition, and UART-based serial monitoring.
