# Quit When There Is An Argument List

To start a Vim session with multiple files in the argument list, name
multiple files when invoking Vim:

```bash
$ vim README.md LICENSE
```

The first file in the argument list, and the current buffer, is `README.md`.
The last file in the argument list is `LICENSE`.

At this point if you try to quit, Vim will prevent you saying `1 more file
to edit`. If we look at the docs for `:q` and `:wq`, we see something along
the lines of:

> This fails when the last file in the argument list has not been edited.

Vim wants to ensure that you've paid attention to every file that you loaded
up into your argument list. If you'd like to quit regardless. then this is
where the `:q!` and `:wq!` variants come in handy. This commands will skip
the argument list check.
