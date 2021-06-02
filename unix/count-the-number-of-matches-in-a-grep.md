# Count The Number Of Matches In A Grep

My go to way of counting the number of matches in a `grep` of a file is to pipe
it to another command — `wc`.

Here is what that looks like with the README for [this
repo](https://github.com/jbranchaud/til). This counts the number of lines that
start with `###`.

```bash
$ grep '^###' README.md | wc -l
      48
```

When `wc` is used with the `-l` flag, it gives a count of the number of lines.
In this case the number of `grep` matches that get piped to it.

There is another way to do this solely with the `grep` command — using the `-c`
flag.

```bash
$ grep -c '^###' README.md
48
```

When you include the `-c` (or `--count`) flag with `grep`, instead of the
matches being output, the count of the matches is output.

See `man grep` for more details.
