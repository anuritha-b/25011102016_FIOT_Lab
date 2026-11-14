; Minimal Cortex-M vector table and reset handler
                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   0x00000400
__initial_sp

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  Reset_Handler
                IMPORT  main

__Vectors       DCD     __initial_sp
                DCD     Reset_Handler
                SPACE   0x100

                AREA    |.text|, CODE, READONLY
Reset_Handler   PROC
                LDR     R0, =main
                BX      R0
                ENDP
                END
