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