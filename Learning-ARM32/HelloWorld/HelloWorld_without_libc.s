.text

.global _start   // To specify the entry point of the program

_start:
    mov r0,#1    // Set r0 as 1 (stdout file descriptor for writing)
    ldr r1,=msg  // Loading the address of message to r1
    mov r2,#13   // Set r2 as 13 (length of the message, including the newline)

    mov r7,#4    // Set r7 as 4 (system call number for sys_write)
    svc 0        // Syscall

    mov r0,#2    // Set r0 as 2 (stderr file descriptor for error output)
    mov r7,#1    // Set r7 as 1 (system call number for sys_exit)
    svc 0        // Syscall
    
.data
msg : .ascii "Hello World!\n" 
