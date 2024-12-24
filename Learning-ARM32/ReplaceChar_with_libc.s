.text

.global main

main:
    ldr r0, =inp1     // Load address of inp1
    bl printf         // Calling printf function in C

    ldr r0, =str_for  // Load format string for scanf
    ldr r1, =iNp1     // Load address of iNp1
    bl scanf          // Calling scanf function in C

    ldr r0, =inp2     // Load address of inp2
    bl printf         // Calling printf function in C

    ldr r0, =for      // Load format string for scanf
    ldr r1, =iNp2     // Load address of iNp2
    bl scanf          // Calling scanf function in C

    ldr r0, =inp3     // Load address of inp3
    bl printf         // Calling printf function in C

    ldr r0, =for      // Load format string for scanf
    ldr r1, =iNp3     // Load address of iNp3
    bl scanf          // Calling scanf function in C

    ldr r3, =iNp1     // Load address of iNp1

change_loop:
    ldrb r4, [r3], #1 // Load byte from iNp1 into r4 and increment r3

    cmp r4, #0        // Compare r4 with 0
    beq exit_loop     // If r4 == 0, exit_loop

    ldr r5, =iNp2     // Load address of iNp2
    ldrb r6, [r5]     // Load the character to replace with

    cmp r4, r6        // Compare r4 with r6
    beq replace_char  // If r4 == r6, replace_char

    b change_loop     // Continue the loop

replace_char:
    ldr r7, =iNp3     // Load address of iNp3
    ldrb r7, [r7]     // Load the replacement character

    sub r3, r3, #1    // Decrement r3 to point back to the character to replace
    strb r7, [r3]     // Replace the character at the current position

    add r3, r3, #1    // Increment r3 to point to the next character
    
    b change_loop     // Continue the loop

exit_loop:
    ldr r0, =out      // Load address of out
    ldr r1, =iNp1     // Load address of iNp1
    bl printf         // Calling printf function in C

    mov r0, #0        // Set r0 as 0 (exit status)
    bl exit           // Calling exit function in C

.data
inp1: .asciz "Enter a string: "
inp2: .asciz "Enter Character to be replaced: "
inp3: .asciz "Enter Character to be replaced with: "
str_for: .asciz "%[^\n]"
for: .asciz "%s"
out: .asciz "Output string: %s\n"

.bss
iNp1:     .skip 10
iNp2:     .skip 1
iNp3:     .skip 1