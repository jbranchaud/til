# Show The Size Of Everything In A Directory

The `ls` command will list everything in a given directory.  The `du`
command is used to display disk usage statistics -- with the `-sh` flag, it
will display the file size in a human readable format.

We can combine these two commands with `xargs` to get a listing of the sizes
of everything in a directory.

```
ls | xargs du -sh
```

See `man du` and `man xargs` for more details.
