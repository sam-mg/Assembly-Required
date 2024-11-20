// This program returns 0
// This is the same as the return 0; statement in C
// The main function is called _main

.global _main
.align 2

_main:
    mov x0, #0
    mov x16, #1
    svc 0
