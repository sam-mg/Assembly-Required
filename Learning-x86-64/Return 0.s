section .text
    global _main        ; Entry point for the program

_main:
    mov eax, 1          ; Set eax as 1 (indicator for sys_exit)
    xor ebx, ebx        ; xor ebx with itself to make it 0
    int 0x80            ; Syscall