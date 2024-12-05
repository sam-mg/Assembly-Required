.text
.global main

main:
    mov r4, #1            // Set r4 to 1 (start of the loop)
    mov r5, #6            // Set r5 to 6 (end of the loop)

for_loop:
    cmp r4, r5            // Compare r4 with r5
    bgt exit_branch       // If r4 > r5, exit loop

    mov r6, #1            // Set r6 to 1 (start from 1 for counting numbers)

number_print:
    cmp r6, r4            // Compare r6 with r4 (number of numbers to print)
    bge print_newline     // If r6 >= r4, print newline

    mov r1, r6            // Move the number (r6) into r1 for printing
    bl print_number

    add r6, r6, #1        // Increment r6
    b number_print        // Repeat the number_print loop

print_newline:
    ldr r0, =nl           // Load address of newline string
    bl printf             // Calling printf function in C

    add r4, r4, #1        // Increment r4
    
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
