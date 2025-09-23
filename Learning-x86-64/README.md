# Learning-x86

I am using this repository to share information on how to compile x86 assembly code and comvert them into objects and after that link them and emulate them. Plus to have a backup of the code I work with.

Let's compile using:
```bash
nasm -f elf32 <.s> -o <.o>
# nasm -f elf32 Return\ 0.s -o Return\ 0.o
```

Let's link it using:
```bash
ld -m elf_i386 <.o> -o <out>
# ld -m elf_i386 Return\ 0.o -o Return\ 0
```

Then execute normally:
```bash
./<executable>
# ./Return\ 0
```

I got fed up with doing this one by one so i just automated it with a bash script:
```bash
function comp_x86_32() {
    if [ -z "$1" ]; then
        echo "Usage: comp_x86_32 <.s>"
        return 1
    fi

    FILE_PATH="$1"

    if [[ "$FILE_PATH" != *.s ]]; then
        echo "Please enter a valid .s file."
        return 1
    fi

    DIR_NAME=$(dirname "$FILE_PATH")
    FILE_NAME=$(basename "$FILE_PATH")
    FILE_NAME_without_extension="${FILE_NAME%.s}"

    nasm -f elf32 "$FILE_PATH" -o "${DIR_NAME}/${FILE_NAME_without_extension}.o" 2>&1
    if [ $? -ne 0 ]; then
        echo "Error occurred during assembly. Command: 'nasm -f elf32 \"$FILE_PATH\" -o \"${DIR_NAME}/${FILE_NAME_without_extension}.o\"'"
        return 1
    fi

    ld -m elf_i386 -e _main "${DIR_NAME}/${FILE_NAME_without_extension}.o" -o "${DIR_NAME}/${FILE_NAME_without_extension}" 2>&1
    if [ $? -ne 0 ]; then
        echo "Error occurred during linking. Command: 'ld -m elf_i386 -e _main \"${DIR_NAME}/${FILE_NAME_without_extension}.o\" -o \"${DIR_NAME}/${FILE_NAME_without_extension}\"'"
        return 1
    fi

    echo "Compilation and linking successful. Output file: ${DIR_NAME}/${FILE_NAME_without_extension}"
}
```
Check this out, it is working fine in my `Google Console`.