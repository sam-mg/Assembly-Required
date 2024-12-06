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

    mov r4, #10       // Move 10 to r4 for loop
    mov r5, #1        // Move 1 to r5 for loop

for_loop:
    cmp r5, r4        // Compare r5 and r4
    bgt exit_loop     // If r5 > r4, go to exit_loop

    ldr r0, =format   // Load format for printing integer
    ldr r1, =iNp      // Load address of input
    ldr r1, [r1]      // Load value of input
    bl printf         // Calling printf function in C

    ldr r0, =x_out    // Load address of x_out
    bl printf         // Calling printf function in C

    ldr r0, =format   // Load format for printing integer
    mov r1, r5        // Move r5 to r1
    bl printf         // Calling printf function in C

    ldr r0, =eq_out   // Load address of eq_out
    bl printf         // Calling printf function in C

    ldr r0, =format   // Load format for printing integer
    ldr r3, =iNp      // Load address of iNp
    ldr r3, [r3]      // Load value of iNp to r3
    mul r1, r3, r5    // Multiply r3 and r5 and store in r1
    bl printf         // Calling printf function in C

    ldr r0, =newline  // Load newline string
    bl printf         // Print newline

    add r5, r5, #1    // Increment r5 by 1
    b for_loop        // Go to for_loop
    
exit_loop:
    mov r0, #0        // Set r0 as 0 (exit status)
    bl exit           // Calling exit function in C

.data
inp:     .asciz "Enter a number: "
for:     .asciz "%d"
out:     .asciz "Multiplication Table of the number: \n"
x_out:   .asciz " x "
eq_out:  .asciz " = "
format:  .asciz "%d"
newline: .asciz "\n"

.bss
iNp:     .skip 4