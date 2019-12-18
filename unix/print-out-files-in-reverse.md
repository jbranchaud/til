# Print Out Files In Reverse

If you're familiar with `cat` -- the command you might use to print out a file
in the terminal -- then you may appreciate a similar command: `tac`.

With `tac` you can

> Write each FILE to standard output, last line first.

Notice that `tac` is `cat` spelled in reverse. That's what it does with your
files, prints them out in reverse.

Give it a try just as you'd use `cat`:

```bash
$ tac README.md
```

See `man tac` for more details.
