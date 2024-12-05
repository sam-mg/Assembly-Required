.text

.global main     // Entry point for the program

main:
    ldr r0, =inp // Loading the address of message to r0
    bl printf    // Calling printf function in C

    ldr r0, =for // Loading the format of input to r0
    ldr r1, =iNp // Loading the address of input to r1
    bl scanf     // Calling scanf function in C

    ldr r0, =out // Loading the address of message to r0
    bl printf    // Calling printf function in C

    ldr r0, =iNp // Loading the address of input to r0
    bl printf    // Calling printf function in C

    bl exit      // Calling exit function in C

.data
inp: .asciz "Enter Something: "
for: .asciz "%s"
out: .asciz "You entered: "

.bss
iNp: .skip 1      // Allocate 1 byte of space for the input