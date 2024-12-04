.text
.global main

main:
    mov r4, #1        // Set r4 to 1 (start of the loop)
    mov r5, #6        // Set r5 to 6 (total number of rows)

for_loop:
    cmp r4, r5        // Compare r4 (current row) with r5 (total rows)
    bge exit_branch   // If r4 >= r5, exit the loop

    mov r6, r5        // Setting copy of r5 to r6
    sub r6, r6, r4    // r6 = r5 - r4 (number of spaces before stars)

    mov r7, #0        // Initialize space counter (r7)

space_print:
    cmp r7, r6        // Compare r7 with number of spaces
    bge print_stars   // If r7 >= r6, start printing stars

    ldr r0, =spac     // Load address of space character
    bl printf         // Calling printf function in C

    add r7, r7, #1    // Increment space counter

    b space_print     // Repeat space printing loop

print_stars:
    mov r8, r4        // r8 = r4 (number of stars to print)

star_print:
    cmp r8, #0        // Check if we have printed all stars
    ble print_newline // If no more stars to print, print newline

    ldr r0, =star     // Load address of star character
    bl printf         // Calling printf function in C

    sub r8, r8, #1    // Decrement star counter

    cmp r8, #0        // Check if we have printed all stars
    bne print_space   // If there are more stars, print a space after the star
    
    b star_print      // Continue printing stars

print_space:
    ldr r0, =spac     // Load space character
    bl printf         // Calling printf function in C

    b star_print      // Branch to printing stars

print_newline:
    ldr r0, =nl       // Load address of newline character
    bl printf         // Calling printf function in C

    add r4, r4, #1    // Increment r4
    b for_loop        // Branch to for_loop for the next row

exit_branch:
    mov r0, #1        // Set r0 to 1 (exit status)
    bl exit           // Calling exit function in C

.data
star: .asciz "*"
spac: .asciz " "
nl: .asciz "\n"
