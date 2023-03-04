# Show Used And Available System Memory

The `free` command will display the total RAM on your system as well as how
much of it is used and how much is still freely available.

```bash
$ free
              total        used        free      shared  buff/cache   available
Mem:        1000260      166004      552808       14440      281448      664724
Swap:             0           0           0
```

The default output format of `free` is not very readable though. To make it
more human readable, you can add the `-h` (_human_) and `--si` (_International
System of Units_) flags.

```bash
$ free -h --si
              total        used        free      shared  buff/cache   available
Mem:           976M        162M        547M         14M        266M        649M
Swap:            0B          0B          0B
```

See `man free` for more details.
