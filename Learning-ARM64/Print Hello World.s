// This program just reboots

.global _main
.align 2

_main:
    b _print
    b _terminate

_print:
    mov x0, #1
    adr x1, helloworld
    mov x2, #12
    mov x16, #4
    svc 0

_terminate:
    mov x0, #0
    mov x16, #1
    svc 0

helloworld: .ascii "Hello, World"