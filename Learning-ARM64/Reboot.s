// This program just reboots

.global _main
.align 2

_main:
    b _reboot
    b _terminate

_reboot:
    mov x0, #1
    mov x16, #55
    svc 0

_terminate:
    mov x0, #0
    mov x16, #1
    svc 0