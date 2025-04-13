// This program is same as the previous one but with instead of giving directly, i just gave it as a branch.

.global _main
.align 2

_main:
    b _terminate

_terminate:
    mov x0, #0
    mov x16, #1
    svc 0