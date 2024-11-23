# Learning-Flutter

I am using this repository to share code between my computer and Google Console, and to have a backup of the code I experiment with.

Let's compile using:
```bash
as <.s> -o <.o>
# as Return\ 0.s -o Return\ 0.o
```

Let's link it using:
```zsh
ld <.o> -o <out> -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e <starting_point> -arch arm64
# ld Return\ 0.o -o Return\ 0 -l System -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _main -arch arm64
```

Then execute normally:
```bash
./<executable>
# ./Return\ 0
```

I got fed up with doing this one by one so i just automated it with a bash script:
```bash
function comp_arm64() {
    if [ -z "$1" ]; then
        echo "Usage: comp_arm <.s>"
        return 1
    fi

    FILE_PATH="$1"

    if [[ "$FILE_PATH" != *.s ]]; then
        echo "Please enter a valid .s file."
        return 1
    fi

    FILE_NAME=$(basename "$FILE_PATH")
    FILE_NAME_without_extension="${FILE_NAME%.s}"

    as -o "$FILE_PATH.o" "$FILE_PATH" 2>&1
    if [ $? -ne 0 ]; then
        echo "Error occurred during assembly. Command: 'as -o \"$FILE_PATH.o\" \"$FILE_PATH\"'"
        return 1
    fi

    ld "$FILE_PATH.o" -o "$FILE_NAME_without_extension" -l System -syslibroot $(xcrun -sdk macosx --show-sdk-path) -e _main -arch arm64 2>&1
    if [ $? -ne 0 ]; then
        echo "Error occurred during linking. Command: 'ld \"$FILE_PATH.o\" -o \"$FILE_NAME_without_extension\" ...'"
        return 1
    fi

    echo "Compilation and linking successful. Output file: $FILE_NAME_without_extension"
}
```
Try out if it is working, it is working fine in mine.
