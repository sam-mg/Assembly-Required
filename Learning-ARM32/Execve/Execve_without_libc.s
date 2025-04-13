.text

.global _start     // To specify the entry point of the program

_start:
    ldr r0, =path  // Load the address of the binary path into r0
    mov r1, #0     // Set r1 as 0 (null pointer)

    mov r7, #11    // Set r7 as 11 (system call number for execve)
    svc 0          // Syscall
    
    mov r0, #1     // Set r0 as 1 (stdout file descriptor for writing)
    mov r7, #1     // Set r7 as 1 (system call number for sys_exit)
    svc 0          // Syscall

.data
path: .asciz "<the_path_of_the_executable>"
