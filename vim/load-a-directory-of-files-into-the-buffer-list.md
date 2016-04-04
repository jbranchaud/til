# Load A Directory Of Files Into The Buffer List

Consider the scenario where I want to go through all files in a directory to
make a series of minor, related changes. After editing each file, I can type
something like `:e path/to/next/file.md` to bring up the next file. That can
get a bit tedious though. Instead, I can load up all the files in the
directory with the `args` command:

```
:args path/to/files/*.md
```

From there, I can use `:bnext` (or `:bn) and `:bprev` to more quickly jump
through those files I want to edit.

I can also run `:ls` to see all the files loaded in to the buffer list at
that point.

[source](http://superuser.com/questions/396481/how-to-load-multiple-files-in-multiple-subdirectories-into-vim-buffers)
