.text

.global _start   // Entry point for the program

_start:
    mov r0, #1   // Set r0 as 1 (stdout file descriptor for writing)
    ldr r1, =inp // Loading the address of message to r1
    mov r2, #17  // Set r2 as 17 (length of the message, including the newline)
    mov r7, #4   // Set r7 as 4 (system call number for sys_write)
    svc 0        // Syscall

    mov r0, #0   // Set r0 as 0 (stdin file descriptor for reading)
    ldr r1, =iNp // Loading the address of message to r1
    mov r2, #1   // Set r2 as 1 (Allocated Space)
    mov r7, #3   // Set r7 as 3 (system call number for sys_read)
    svc 0        // Syscall

    mov r0, #1   // Set r0 as 1 (stdout file descriptor for writing)
    ldr r1, =out // Loading the address of message to r1
    mov r2, #13  // Set r2 as 13 (length of the message, including the newline)
    mov r7, #4   // Set r7 as 4 (system call number for sys_write)
    svc 0        // Syscall

    mov r0, #1   // Set r0 as 1 (stdout file descriptor for writing)
    ldr r1, =iNp // Loading the address of message to r1
    mov r2, #1   // Set r2 as 1 (length of the message)
    mov r7, #4   // Set r7 as 4 (system call number for sys_write)
    svc 0        // Syscall

    mov r0,#2    // Set r0 as 2 (stderr file descriptor for error output)
    mov r7,#1    // Set r7 as 1 (system call number for sys_exit)
    svc 0        // Syscall

.data
inp: .ascii "Enter Something: "
out: .ascii "You entered: "

.bss
iNp: .skip 1     // Allocate 1 byte of space for the input