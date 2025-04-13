.text
.global main

main:
    ldr r0, =inp      // Load address of inp
    bl printf         // Calling printf function in C

    ldr r0, =for      // Load format string
    ldr r1, =iNp      // Load address of iNp
    bl scanf          // Calling scanf function in C

    ldr r0, =out      // Load address of out
    bl printf         // Calling printf function in C

    ldr r0, =iNp      // Load address of iNp
    bl strlen         // Calling strlen function in C

    mov r1, r0        // Move length to r1 for printf
    ldr r0, =form     // Load format string
    bl printf         // Calling printf function in C

    mov r0,#1         // Set r0 as 1 (exit status)
    bl exit           // Calling exit function in C

.data
inp:    .asciz "Enter Some String: "
for:    .asciz "%s"
form:   .asciz "%d\n"
out:    .asciz "Length of the string: "

.bss
iNp:    .skip 100