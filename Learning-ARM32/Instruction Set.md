# Instruction Set

In this section, I will discuss the instructions used in ARM Assembly Language.

| Instruction | Comments / Uses |
|:-:|:-:|
| ldr | Used to load values into a register. <br> `ldr <register>, [ <address> ]` <br> `ldr R0, =0x1000` // This sets the value `0x1000` to the register `R0`. <br> `ldr R0, [R1]` // This loads the value present in `R1` into `R0`. |
| mov | Similar to `ldr`, but with a subtle difference. `mov` is used to copy data between registers or load an immediate value into a register, while `ldr` loads data from a memory address. |
| svc | Similar to `syscall`. Creates interrupts that are then handled by the CPU. <br> `svc #<immediate value>` // Based on the values in the registers and the immediate value, actions will be performed. |
| bl | Branch Link - Used when calling C functions with `libc`. |
| cmp | Compare - Used to compare two values, allowing branching using <br> `beq` (Branch if Equal), <br> `bne` (Branch if Not Equal), <br> `bgt` (Branch if Greater Than), <br> `blt` (Branch if Less Than), <br> `bge` (Branch if Greater or Equal), <br> `ble` (Branch if Less or Equal). |
| b | Branch - Used to branch to a different part of the code. <br> `b <label>` // This jumps to the code at the specified label. |
| add | Add - Used to add two values. <br> `add <destination>, <register>, <register/value>` |
| sub | Subtract - Used to subtract two values. <br> `sub <destination>, <register>, <register/value>` <br> `<destination> = <register> - <register/value>` |
| rsb | Reverse Subtract <br> `rsb <destination>, <register>, <register/value>` <br> `<destination> = <register/value> - <register>` |
| mul | Multiply - Used to multiply two values. <br> `mul <destination>, <register>, <register/value>` <br> `<destination> = <register> * <register/value>` |
| ldrb | Load Register Byte - Used to load an 8-bit value into a register. <br> `ldrb <register>, [ <address> ]` <br> `ldrb R0, [R1]` // This loads the byte value present at the address in `R1` into `R0` |
| strb | Store Register Byte - Used to store an 8-bit value from a register into memory. <br> `strb <register>, [ <address> ]` <br> `strb R0, [R1]` // This stores the byte value in `R0` into the address in `R1` |