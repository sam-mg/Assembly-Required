.text
.global main

main:
    ldr r0, =inp      // Load address of inp
    bl printf         // Calling printf function in C

    ldr r0, =for      // Load format string for scanf
    ldr r1, =iNp      // Load address of iNp
    bl scanf          // Calling scanf function in C

    ldr r5, =iNp      // Load address of iNp
    ldr r5, [r5]      // Load value of iNp into r5

    ldr r0, =out      // Load address of out
    bl printf         // Calling printf function in C

    mov r6, #0        // First number in Fibonacci sequence
    mov r7, #1        // Second number in Fibonacci sequence
    mov r4, #0        // Loop counter starts at 0

fibonacci_loop:
    cmp r4, r5        // Compare loop counter with input number
    bge exit_loop     // If loop counter >= input number, exit loop

    ldr r0, =for      // Format string for printing integers
    mov r1, r6        // Argument for printf (Fibonacci number)
    bl printf

    ldr r0, =nl       // Format string for new line
    bl printf         // Print new line

    add r8, r6, r7    // Add first and second number
    mov r6, r7        // Move second number to first number
    mov r7, r8        // Move sum to second number

    add r4, r4, #1    // Increment loop counter
    b fibonacci_loop  // Continue the loop

exit_loop:
    mov r0, #0        // Set r0 as 0 (exit status)
    bl exit           // Calling exit function in C

.data
inp:    .asciz "Enter any number (Greater than 2): "
for:    .asciz "%d"
out:    .asciz "Fibonacci Sequence: \n"
nl:     .asciz "\n"

.bss
iNp:    .skip 4