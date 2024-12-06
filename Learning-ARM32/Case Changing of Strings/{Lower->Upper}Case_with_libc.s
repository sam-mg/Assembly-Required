.text

.global main

main:
    ldr r0, =inp      // Load address of inp
    bl printf         // Calling printf function in C

    ldr r0, =for      // Load format string for scanf
    ldr r1, =iNp      // Load address of iNp
    bl scanf          // Calling scanf function in C

    ldr r0, =iNp      // Load address of iNp

convert_loop:
    ldrb r1, [r0], #1 // Load byte from r0 to r1, increment r0 by 1

    cmp r1, #0x0      // Compare r1 with 0x0
    beq exit_loop     // If r1 == 0x0, exit loop

    cmp r1, #'a'      // Compare r1 with 'a'
    blt convert_loop  // If r1 < 'A', continue the loop
    cmp r1, #'z'      // Compare r1 with 'z'
    bgt convert_loop  // If r1 > 'z', continue the loop

    sub r1, r1, #32   // Convert to upper case
    strb r1, [r0, #-1]// Store byte back to r0

    b convert_loop    // Continue the loop

exit_loop:
    ldr r0, =out      // Load address of out
    bl printf         // Calling printf function in C

    ldr r0, =iNp      // Load address of iNp
    bl printf         // Calling printf function in C

    mov r0, #0        // Set r0 as 0 (exit status)
    bl exit           // Calling exit function in C

.data
inp:     .asciz "Enter a String: "
out:     .asciz "Converted String: "
for:     .asciz "%s"

.bss
iNp:     .skip 100