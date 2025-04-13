.text

.global main       // Specify the entry point of the program

main:
    ldr r0, =path  // Load the address of the binary path into r0

    bl execve      // Call execve function in C
    bl exit        // Calling exit function in C

.data
path: .asciz "<the_path_of_the_executable>"
