/* CAT14 - STM32 Experiment
 * Platform   : STM32 (Nucleo Board)
 * Description: [Add experiment description here]
 * Author     : Anuritha B (25011102016)
 */

#include "main.h"

int main(void) {
    HAL_Init();

    // TODO: Add experiment logic here

    while (1) {
        // main loop
    }
}

void Error_Handler(void) {
    __disable_irq();
    while (1) {}
}

