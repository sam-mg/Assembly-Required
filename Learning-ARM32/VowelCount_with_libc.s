.text

.global main

main:
    ldr r0, =inp      // Load address of inp
    bl printf         // Calling printf function in C

    ldr r0, =for      // Load format string for scanf
    ldr r1, =iNp      // Load address of iNp
    bl scanf          // Calling scanf function in C

    ldr r0, =iNp      // Load address of iNp

    mov r1, #0        // Initialize r4 as 0 (counter for vowels)
    ldr r2, =counter  // Load address of counter
    str r1, [r2]      // Store initial vowel count (0)

for_loop:
    ldrb r1, [r0], #1 // Load byte from r0 to r1, increment r0 by 1

    cmp r1, #0        // Compare r1 with 0
    beq exit_loop     // If r1 == 0, exit loop

    // For Small Letters
    cmp r1, #'a'      // Compare r1 with 'a'
    beq count_vowels  // Go to count_vowels
    cmp r1, #'e'
    beq count_vowels
    cmp r1, #'i'
    beq count_vowels
    cmp r1, #'o'
    beq count_vowels
    cmp r1, #'u'
    beq count_vowels

    // For Capital Letters
    cmp r1, #'A'
    beq count_vowels
    cmp r1, #'E'
    beq count_vowels
    cmp r1, #'I'
    beq count_vowels
    cmp r1, #'O'
    beq count_vowels
    cmp r1, #'U'
    beq count_vowels

    b for_loop        // Continue the loop

count_vowels:
    ldr r2, =counter  // Load address of counter
    ldr r3, [r2]      // Load current vowel count

    add r3, r3, #1    // Increment vowel count

    str r3, [r2]      // Store updated vowel count
    
    b for_loop        // Continue the loop

exit_loop:
    ldr r0, =out      // Load address of out
    ldr r1, =counter  // Load address of counter
    ldr r1, [r1]      // Load the vowel count
    bl printf         // Calling printf function in C

    mov r0, #0        // Set r0 as 0 (exit status)
    bl exit           // Calling exit function in C

.data
inp:     .asciz "Enter a String: "
out:     .asciz "Number of Vowels: %d"
for:     .asciz "%[^\n]"

.bss
iNp:     .skip 10
counter: .skip 4