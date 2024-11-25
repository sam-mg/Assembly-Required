# Instruction Set

In this section i will taking about the instruction which can be used in ARM Assembly Language.

| Instruction | Comments / Uses |
|:-:|:-:|
| ldr | Used to load values in a register <br> `ldr <register>, [ <address> ]` <br> `ldr R0, =0x1000` // This will set the value `0x1000` to the register `R0` <br> `ldr R0, [R1]` // This is load the value present in the `R1` into `R0` |
| mov | Kinda a similar to `ldr`, but a very minute difference `mov` is used to copy data between registers<br>or load an immediate value into a register, while LDR loads data from a memory address. |
| svc | Kinda like `syscall`. Creates interrupts which are then handled by the CPU. <br> `svc #<immediate value>` // Based on the values in the `registers` and `immediate value` actions will be done. |
| bl | Branch Link - While using `c` functions `with_libc`. |