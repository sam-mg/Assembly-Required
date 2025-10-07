section .data
    msg db 'Hello, World!', 10    ; Hello World, appended with "\n"
    len equ $ - msg               ; Length of msg

section .text
    global _main                  ; Entry point for the program

_main:
    mov eax, 4                    ; Set eax as 4 (indicator for writing)
    mov ebx, 1                    ; Set ebx as 1 (indicator for stdout)
    mov ecx, msg                  ; Loading the address of prompt to ecx
    mov edx, len                  ; Loading the length of prompt to edx
    int 0x80                      ; Syscall

    mov eax, 1                    ; Set eax as 1 (indicator for sys_exit)
    xor ebx, ebx                  ; xor ebx with itself to make it 0
    int 0x80                      ; Syscall