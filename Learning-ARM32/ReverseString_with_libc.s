.text

.global main

main:
    ldr r0, =inp       // Load address of inp
    bl printf          // Calling printf function in C

    ldr r0, =for       // Load format string for scanf
    ldr r1, =iNp       // Load address of iNp 
    bl scanf           // Calling scanf function in C

    ldr r0, =iNp       // Load address of iNp
    bl strlen          // Calling strlen function in C

    mov r6, r0         // Store length of string in r6

    ldr r4, =iNp       // Load address of iNp
    ldr r5, =oUt       // Load address of oUt

    add r4, r4, r6     // Adding r6 to point the end of the r4
    sub r4, r4, #1     // Move r4 to the last character of the string
    mov r2, #0         // Initialize r2 as 0 (counter for reversed string)

reverse_loop:
    cmp r6, #0         // Compare r6 with 0
    ble exit_loop      // If r6 <= 0, go to exit_loop

    ldrb r3, [r4]      // Load byte from r4 to r3
    strb r3, [r5, r2]  // Store byte from r3 to r5

    sub r4, r4, #1     // Decrement r4 to the previous character
    add r2, r2, #1     // Increment r2 to the next character
    sub r6, r6, #1     // Decrement r6 to the previous character

    b reverse_loop     // Continue the loop

exit_loop:
    mov r3, #0         // Null terminator
    strb r3, [r5, r2]  // Store null terminator at the end of reversed string

    ldr r0, =out       // Load format string for printf
    ldr r1, =oUt       // Load address of oUt
    bl printf          // Calling printf function in C

    mov r0, #0         // Set r0 as 0 (exit status)
    bl exit            // Calling exit function in C

.data
inp:  .asciz "Enter a string: "
out:  .asciz "Reversed string: %s\n"
for:  .asciz "%[^\n]"

.bss
iNp:   .skip 100
oUt:   .skip 100