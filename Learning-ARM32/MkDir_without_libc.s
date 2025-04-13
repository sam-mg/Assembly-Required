.text

.global _start

_start:
    mov r7, #0x27 // Set r7 as 0x27 (system call number for sys_mkdir)
    ldr r0, =path // Load the address of path to r0
    svc 0         // Syscall

    mov r7,#1     // Set r7 as 1 (system call number for sys_exit)
    svc 0         // Syscall

.data
path: .asciz "<some_dir>"