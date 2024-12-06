.text
.global main

main:
    mov r4, #1        // Set r4 to 1 (start of the loop)
    mov r5, #6        // Set r5 to 6 (end of the loop)

for_loop:
    cmp r4, r5        // Compare r4 with r5
    bge exit_branch   // If r4 >= r5, exit loop

    mov r6, #0        // Set r6 to 0 (used for counting stars)
    
star_print:
    cmp r6, r4        // Compare r6 with r4 (number of stars to print)
    bge print_newline // If r6 >= r4, print newline and exit star_print

    ldr r0, =star     // Load address of star
    bl printf         // Calling printf function in C

    add r6, r6, #1    // Increment r6
    b star_print      // Repeat the star print loop

print_newline:
    ldr r0, =nl       // Load address of newline string
    bl printf         // Calling printf function in C

    add r4, r4, #1    // Increment r4 (next number of stars)
    b for_loop        // Repeat the loop

exit_branch:
    mov r0, #1        // Set r0 to 1 (exit status)
    bl exit           // Calling exit function in C

.data
star: .asciz "* "
nl: .asciz "\n"