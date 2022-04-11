# Remove A Directory Called `-p`

I accidentally created a directory from the terminal called `-p`. It is sitting
there next to other directories like `app` and `public`. I need to get rid of
it. The `rmdir` command is the best way to do that.

```bash
$ rmdir -p
usage: rmdir [-p] directory ...
```

Not so fast. `-p` is also a valid flag for the `rmdir` command. It doesn't know
that I mean it as the name of the directory. So instead, I am missing a
required argument to `rmdir` – the directory.

To get this to work, I need to tell `rmdir` that I intend `-p` as the name of
the directory to remove.

```
$ rmdir -- -p
```

The `--` is a command-line convention. It tells the command that anything after
the `--` is not a flag, but instead an argument. This time the `-p` directory
will be removed.
