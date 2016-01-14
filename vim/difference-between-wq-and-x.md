# Difference Between :wq and :x

The `:wq` command is used in Vim to write and quit. The contents of the
buffer are written to disk for the associated file and then the Vim session
is terminated. So, what is the difference between this and the `:x` command.
The Vim help files give the following description of the `:x` command:

> Like ":wq", but write only when changes have been made.

So, `:wq` writes the buffer to disk either way, whereas `:x` just exits if the
buffer hasn't changed. Either way the contents of the resulting file are
going to be the same. So what's the difference?

Modification time.

If you `:x` a buffer that hasn't changed, the modification time will be
untouched because the file isn't *re-saved*. The `:wq` command will alter
the modification time no matter what.

This matters if the modification time is used by anything. For instance, a
background process that monitors a directory for changed files based on
modification times will get some false positives if you use `:wq` too
liberally.

[source](http://docstore.mik.ua/orelly/unix3/vi/ch05_03.htm)
