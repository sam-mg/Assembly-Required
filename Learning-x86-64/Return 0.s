section .text
    global _main

_main:
    mov eax, 1
    xor ebx, ebx
    int 0x80