# All The Ways To Write And Quit In Vim

There are a bunch of different ways to write files, to quit out of a Vim
session, and to write and quit.

The standard is `:wq` to write to the file and quit. There is `:xall` which
will write changes to all buffers and quit.

`:q`, `:q!`, and `ZQ`—the latter being a normal mode command—are all ways of
quitting Vim. The first will warn of unsaved changes. The other two will
discard unsaved changes.

Another favorite of mine, when bailing on a `git commit`, is `:cq`.

These and more can be found in the help files by running `:h Q_wq`.
