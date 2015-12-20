# Copying File Contents To System Paste Buffer

If you need to copy and paste the contents of a file, the `pbcopy` command
can be one of the best ways to accomplish this. Simply `cat` the file and
pipe that into `pbcopy` to get the contents of the file into the system
paste buffer.

```
$ cat some-file.txt | pbcopy
```

See `man pbcopy` for more details.
