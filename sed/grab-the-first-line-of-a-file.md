# Grab The First Line Of A File

You can grab the first line of a file with `sed` using either the `p` (print)
command or the `d` (delete) command.

First, the _print_ command can be told to print the line matching the line
number `1`. That combined with the `-n` flag, which suppresses all lines not
explicitly printed, will print just the first line in the file.

```bash
$ sed '1 p' README.md
# TIL
```

Second, the _delete_ command can be told to delete all lines that aren't the
first (`1`) line.

```bash
$ sed '1! d' README.md
# TIL
```

The `1` will match on the first line. By following it with `!`, that will
negate it so that it represents all lines except `1`.

See `man sed` for more details.

Note: there are more efficient ways, not using `sed`, to get the first line in
a file. This is an exercise in using and understanding some `sed` features.
