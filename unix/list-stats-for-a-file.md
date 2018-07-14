# List Stats For A File

The `ls` command is good for listing files. Tacking on the `-la` flags gives
you a bunch of info about each of the listed files. To get even more info,
we can use the `stat` command.

```bash
$ stat README.md
16777220 143994676 -rw-r--r-- 1 jbranchaud staff 0 53557 "Jul 14 14:53:44 2018" "Jul 10 14:54:39 2018" "Jul 10 14:54:39 2018" "Jul 10 14:54:39 2018" 4096 112 0 README.md
```

That's definitely more info, but it is unlabeled and a lot to parse. We can
improve the output with the `-x` flag.

```bash
$ stat -x README.md
  File: "README.md"
  Size: 53557        FileType: Regular File
  Mode: (0644/-rw-r--r--)         Uid: (  501/jbranchaud)  Gid: (   20/   staff)
Device: 1,4   Inode: 143994676    Links: 1
Access: Sat Jul 14 14:53:44 2018
Modify: Tue Jul 10 14:54:39 2018
Change: Tue Jul 10 14:54:39 2018
```

See `man stat` for more details.

[source](https://www.unixtutorial.org/2008/11/how-to-update-atime-and-mtime-for-a-file-in-unix/)
