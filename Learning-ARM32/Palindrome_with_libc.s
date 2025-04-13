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
    ble compare_start  // If r6 <= 0, go to exit_loop

    ldrb r3, [r4]      // Load byte from r4 to r3
    strb r3, [r5, r2]  // Store byte from r3 to r5

    sub r4, r4, #1     // Decrement r4 to the previous character
    add r2, r2, #1     // Increment r2 to the next character
    sub r6, r6, #1     // Decrement r6 to the previous character

    b reverse_loop     // Continue the loop

compare_start:
    mov r3, #0         // Null terminator
    strb r3, [r5, r2]  // Store null terminator at the end of reversed string

    ldr r4, =iNp       // Load address of iNp
    ldr r5, =oUt       // Load address of oUt
    mov r6, #0         // Initialize counter for string comparison

compare_loop:
    ldrb r3, [r4, r6]  // Load byte from iNp[r6]
    ldrb r7, [r5, r6]  // Load byte from oUt[r6]

    cmp r3, r7         // Compare the two characters
    bne not_palindrome // If not equal, jump to not_palindrome

    add r6, r6, #1     // Increment the index

    cmp r3, #0         // Check if we reached the null terminator
    beq palindrome     // If reached null terminator, it's a palindrome
    
    b compare_loop     // Continue comparing

not_palindrome:
    ldr r0, =out_l     // Load address of out_l
    bl printf          // Calling printf function in C
    b exit_loop        // Exit part

palindrome:
    ldr r0, =out_w     // Load address of out_w
    bl printf          // Calling printf function in C

exit_loop:
    mov r0, #0         // Set r0 as 0 (exit status)
    bl exit            // Calling exit function in C

.data
inp:     .asciz "Enter a String: "
for:     .asciz "%[^\n]"
out_w:     .asciz "It is a Palindrome\n"
out_l:     .asciz "It is not a Palindrome\n"

.bss
iNp:     .skip 100
oUt:     .skip 100