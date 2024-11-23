# Learning-ARM32

This repository serves as a bridge for transferring code between my Mac and Google Console. It also provides guidance on compiling assembly code, converting it into object files, linking, and emulating them. Additionally, it acts as a backup for my experimental code.

First, let's compile files without libc:
```bash
arm-linux-gnueabi-as <.s> -o <.o>
# Example: arm-linux-gnueabi-as hello_world_without_libc.s -o hello_world_without_libc.o
```

Next, link the object file:
```bash
arm-linux-gnueabi-ld <.o> -o <output>
# Example: arm-linux-gnueabi-ld hello_world_without_libc.o -o hello_world_without_libc
```

Finally, emulate the output:
```bash
qemu-arm <output>
# Example: qemu-arm hello_world_without_libc
```

Now, for files with libc:
Compile and link using gcc:
```bash
arm-linux-gnueabi-gcc -static <.s> -o <output>
# Example: arm-linux-gnueabi-gcc -static hello_world_with_libc.s -o hello_world_with_libc
```

Then emulate the output:
```bash
qemu-arm <output>
# Example: qemu-arm hello_world_with_libc
```

To streamline this process, let's automate it with a bash script:
```bash
function comp_arm32() {
    if [ -z "$1" ]; then
        echo "Usage: comp_arm32 <.s>"
        return 1
    fi

    FILE_PATH="$1"
    OUTPUT_NAME=""
    OBJ_NAME=""

    if [[ "$FILE_PATH" == *"_with_libc.s" ]]; then
        echo -e "\nCompiling with libc..."
        OUTPUT_NAME="${FILE_PATH%.s}"
        
        arm-linux-gnueabi-gcc -static "$FILE_PATH" -o "$OUTPUT_NAME" 2>&1
        if [ $? -eq 0 ]; then
            echo -e "\nCompilation successful. Emulating with qemu-arm...\n"
            qemu-arm "$OUTPUT_NAME" 2>&1
        else
            echo "Compilation failed for $FILE_PATH."
        fi

        rm "$OUTPUT_NAME"
        echo -e "\nDeleted executable file: $OUTPUT_NAME"
        
    elif [[ "$FILE_PATH" == *"_without_libc.s" ]]; then
        echo -e "\nCompiling without libc..."
        OUTPUT_NAME="${FILE_PATH%.s}"
        OBJ_NAME="$OUTPUT_NAME.o"
        
        arm-linux-gnueabi-as "$FILE_PATH" -o "$OBJ_NAME" 2>&1
        if [ $? -eq 0 ]; then
            arm-linux-gnueabi-ld "$OBJ_NAME" -o "$OUTPUT_NAME" 2>&1
            if [ $? -eq 0 ]; then
                echo -e "\nCompilation and linking successful. Emulating with qemu-arm...\n"
                qemu-arm "$OUTPUT_NAME" 2>&1
            else
                echo "Linking failed for $OBJ_NAME."
            fi
        else
            echo "Assembly failed for $FILE_PATH."
        fi

        rm "$OBJ_NAME" "$OUTPUT_NAME"
        echo -e "\nDeleted object file: $OBJ_NAME & executable file: $OUTPUT_NAME"

    else
        echo "Please enter a valid .s file ending with either '_with_libc.s' or '_without_libc.s'."
        return 1
    fi
}
```
