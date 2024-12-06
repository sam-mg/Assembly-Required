.text
.global main

main:
    mov r4, #1            // Set r4 to 1 (the first number to print)
    mov r5, #1            // Set r5 to 1 (the initial count of numbers)
    mov r6, #1            // Set r6 to 1 (the loop counter for line number)

for_loop:
    cmp r6, #6            // Compare r6 with 6
    bge exit_branch       // If r6 >= 6, exit the loop

    mov r7, #0            // Set r7 to 0 (used to count the numbers printed in this line)
    
number_print:
    cmp r7, r5            // Compare r7 with r5
    bge print_newline     // If r7 >= r5, print newline

    mov r1, r4            // Move the current number (r4) to r1 for printing
    bl print_number

    add r4, r4, #1        // Increment r4 (next number)
    add r7, r7, #1        // Increment r7 (count numbers printed on this line)
    b number_print        // Repeat number printing

print_newline:
    ldr r0, =nl           // Load address of newline string
    bl printf             // Calling printf function in C

    add r5, r5, #1        // Increment r5 to print number
    add r6, r6, #1        // Increment r6 to move to next line

    b for_loop            // Repeat the for_loop

exit_branch:
    mov r0, #1            // Set r0 to 1 (exit status)
    bl exit               // Calling exit function in C

print_number:
    push {r4, r5, r6, lr} // Save registers to avoid Segmentation Errors

    ldr r0, =num_format   // Already moved the integer to r1 for printing now loading the format string
    bl printf             // Print the number

    pop {r4, r5, r6, pc}  // Restore registers and return

.data
nl: .asciz "\n"
num_format: .asciz "%d "
