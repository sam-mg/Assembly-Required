section .data
    prompt db "What's Your Name? "                         ; Prompt
    prompt_len equ $ - prompt                              ; Lenght of prompt

    hello db "Hello "                                      ; Hello
    hello_len equ $ - hello                                ; Lenght of hello

    expexclamation_mark db "!", 10                         ; Expexclamation Mark  
    expexclamation_mark_len equ $ - expexclamation_mark    ; Length of expexclamation_mark

section .bss
    iNp resb 773                                           ; Allocate 773 byte for the input

section .text
    global _main                                           ; Entry point for the program

_main:
    mov eax, 4                                             ; Set eax as 4 (indicator for writing)
    mov ebx, 1                                             ; Set ebx as 1 (indicator for stdout)
    mov ecx, prompt                                        ; Loading the address of prompt to ecx
    mov edx, prompt_len                                    ; Loading the length of prompt to edx
    int 0x80                                               ; Syscall

    mov eax, 3                                             ; Set eax as 3 (indicator for reading)
    mov ebx, 0                                             ; Set ebx as 0 (indicator for stdin)
    mov ecx, iNp                                           ; Loading the address of input to ecx
    mov edx, 772                                           ; Loading the length of input to edx
    int 0x80                                               ; Syscall

    dec eax                                                ; Decrease eax by 1 (remove newline)
    mov byte [iNp + eax], 0                                ; Add null terminator at the end of input

    mov eax, 4                                             ; Set eax as 4 (indicator for writing)
    mov ebx, 1                                             ; Set ebx as 1 (indicator for stdout)
    mov ecx, hello                                         ; Loading the address of hello to ecx
    mov edx, hello_len                                     ; Loading the length of hello to edx
    int 0x80                                               ; Syscall

    mov eax, 4                                             ; Set eax as 4 (indicator for writing)
    mov ebx, 1                                             ; Set ebx as 1 (indicator for stdout)
    mov ecx, iNp                                           ; Loading the address of iNp to ecx
    mov edx, 772                                           ; Loading the length of input to edx
    int 0x80                                               ; Syscall

    mov eax, 4                                             ; Set eax as 4 (indicator for writing)
    mov ebx, 1                                             ; Set ebx as 1 (indicator for stdout)
    mov ecx, expexclamation_mark                           ; Loading the address of expexclamation_mark to ecx
    mov edx, expexclamation_mark_len                       ; Loading the length of expexclamation_mark to edx
    int 0x80                                               ; Syscall

    mov eax, 1                                             ; Set eax as 1 (indicator for sys_exit)
    xor ebx, ebx                                           ; xor ebx with itself to make it 0
    int 0x80                                               ; Syscall