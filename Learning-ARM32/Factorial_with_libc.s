.global main

main:
    ldr r0, =inp      // Load address of inp
    bl printf         // Calling printf function in C

    ldr r0, =for      // Load format string for scanf
    ldr r1, =iNp      // Load address of iNp
    bl scanf          // Calling scanf function in C

    ldr r0, =out      // Load address of out
    bl printf         // Calling printf function in C

    mov r4, #1        // For storing result (factorial result)
    ldr r5, =iNp      // Load address of iNp
    ldr r5, [r5]      // Load value of iNp into r5

for_loop:
    cmp r5, #0        // Compare r5 with 0
    ble exit_loop     // If r5 <= 0, exit loop

    mul r6, r4, r5    // Multiply r4 by r5, store result in r6
    mov r4, r6        // Move result back to r4
    sub r5, r5, #1    // Decrement r5 by 1

    b for_loop        // Continue the loop

exit_loop:
    ldr r0, =for      // Load the format string to print the result
    mov r1, r4        // Move result of factorial into r1
    bl printf         // Calling printf to output the result

    mov r0, #0        // Set r0 as 0 (exit status)
    bl exit           // Calling exit function in C

.data
inp:     .asciz "Enter a number: "
for:     .asciz "%d"
out:     .asciz "Factorial of the number: "

.bss
iNp:     .skip 4