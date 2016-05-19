# Show Disk Usage For The Current Directory

The `du` utility can be used to show disk usage for a particular directory
or set of directories. When used without any arguments, it will show the
disk usage for the current directory.

```bash
$ du
80      ./.git/hooks
8       ./.git/info
256     ./.git/logs/refs/heads
...
```

with the `-h` command we can see it all in a human-readable format

```bash
$ du -h
 40K    ./.git/hooks
4.0K    ./.git/info
128K    ./.git/logs/refs/heads
```

and to get an even clearer picture we can pipe that through `sort -nr`

```bash
$ du -h | sort -nr
412K    ./vim
352K    ./postgres
340K    ./.git/logs
216K    ./.git/logs/refs
184K    ./ruby
156K    ./unix
148K    ./git
...
```

This sorts it numerically in reverse order putting the largest stuff at the
top.
