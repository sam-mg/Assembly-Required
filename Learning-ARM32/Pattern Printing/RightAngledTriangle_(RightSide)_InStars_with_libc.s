.text
.global main

main:
    mov r4, #1        // Set r4 to 1 (start of the loop)
    mov r5, #6        // Set r5 to 6 (end of the loop)

for_loop:
    cmp r4, r5        // Compare r4 with r5
    bge exit_branch   // If r4 >= r5, exit the loop

    rsb r7, r4, #5    // r7 = (5 - r4) => No. of spaces
    
print_spaces:
    cmp r7, #0        // Compare r7 with 0 to check if we have printed all the spaces
    beq star_print    // If yes, go to star_print

    ldr r0, =spac     // Load address of space
    bl printf         // Calling printf function in C
    
    sub r7, r7, #1    // Decrement space count
    b print_spaces    // Repeat space printing

star_print:
    mov r6, #0        // Set r6 to 0 (used for counting stars)

print_stars:
    cmp r6, r4        // Compare r6 with r4 (total number of stars)
    bge print_newline // If r6 >= r4, go to print_newline

    ldr r0, =star     // Load address of star
    bl printf         // Calling printf function in C

    add r6, r6, #1    // Increment r6 to print star
    b print_stars     // Repeat the star print loop

print_newline:
    ldr r0, =nl       // Load address of newline string
    bl printf         // Calling printf function in C

    add r4, r4, #1    // Increment r4 to move to next line
    b for_loop        // Repeat the loop

exit_branch:
    mov r0, #1        // Set r0 to 1 (exit status)
    bl exit           // Calling exit function in C

.data
star: .asciz " *"
nl: .asciz "\n"
spac: .asciz "  "
