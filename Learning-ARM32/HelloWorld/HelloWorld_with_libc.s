.text

.global _start    // To specify the entry point of the program

_start:
    ldr r0,=msg // Loading the address of message to r0
    bl printf   // Calling printf function in C

    mov r0,#1   // Set r0 as 1 (exit status)
    bl exit     // Calling exit function in C

.data
msg: .ascii "Hello World!\n"
