# Hexdump A Compiled File

The `hexdump` unix utility allows you to dump the contents of a
compiled/executable file in a _readable_ hexadecimal format. Adding the `-C`
flag includes a sidebar with a formatted version of that row of hexadecimal.

For example, a compiled _Hello World_ java program, `Hello.java`, will look
something like this:

```
> cat Hello.class | hexdump -C
00000000  ca fe ba be 00 00 00 34  00 1d 0a 00 06 00 0f 09  |.......4........|
00000010  00 10 00 11 08 00 12 0a  00 13 00 14 07 00 15 07  |................|
00000020  00 16 01 00 06 3c 69 6e  69 74 3e 01 00 03 28 29  |.....<init>...()|
00000030  56 01 00 04 43 6f 64 65  01 00 0f 4c 69 6e 65 4e  |V...Code...LineN|
00000040  75 6d 62 65 72 54 61 62  6c 65 01 00 04 6d 61 69  |umberTable...mai|
00000050  6e 01 00 16 28 5b 4c 6a  61 76 61 2f 6c 61 6e 67  |n...([Ljava/lang|
00000060  2f 53 74 72 69 6e 67 3b  29 56 01 00 0a 53 6f 75  |/String;)V...Sou|
00000070  72 63 65 46 69 6c 65 01  00 0a 48 65 6c 6c 6f 2e  |rceFile...Hello.|
00000080  6a 61 76 61 0c 00 07 00  08 07 00 17 0c 00 18 00  |java............|
00000090  19 01 00 0d 48 65 6c 6c  6f 2c 20 57 6f 72 6c 64  |....Hello, World|
000000a0  21 07 00 1a 0c 00 1b 00  1c 01 00 05 48 65 6c 6c  |!...........Hell|
000000b0  6f 01 00 10 6a 61 76 61  2f 6c 61 6e 67 2f 4f 62  |o...java/lang/Ob|
000000c0  6a 65 63 74 01 00 10 6a  61 76 61 2f 6c 61 6e 67  |ject...java/lang|
000000d0  2f 53 79 73 74 65 6d 01  00 03 6f 75 74 01 00 15  |/System...out...|
000000e0  4c 6a 61 76 61 2f 69 6f  2f 50 72 69 6e 74 53 74  |Ljava/io/PrintSt|
000000f0  72 65 61 6d 3b 01 00 13  6a 61 76 61 2f 69 6f 2f  |ream;...java/io/|
00000100  50 72 69 6e 74 53 74 72  65 61 6d 01 00 07 70 72  |PrintStream...pr|
00000110  69 6e 74 6c 6e 01 00 15  28 4c 6a 61 76 61 2f 6c  |intln...(Ljava/l|
00000120  61 6e 67 2f 53 74 72 69  6e 67 3b 29 56 00 20 00  |ang/String;)V. .|
00000130  05 00 06 00 00 00 00 00  02 00 00 00 07 00 08 00  |................|
00000140  01 00 09 00 00 00 1d 00  01 00 01 00 00 00 05 2a  |...............*|
00000150  b7 00 01 b1 00 00 00 01  00 0a 00 00 00 06 00 01  |................|
00000160  00 00 00 01 00 09 00 0b  00 0c 00 01 00 09 00 00  |................|
00000170  00 25 00 02 00 01 00 00  00 09 b2 00 02 12 03 b6  |.%..............|
00000180  00 04 b1 00 00 00 01 00  0a 00 00 00 0a 00 02 00  |................|
00000190  00 00 03 00 08 00 04 00  01 00 0d 00 00 00 02 00  |................|
000001a0  0e                                                |.|
000001a1
```
