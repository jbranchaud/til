# Output Only Lines Involved In A Substitution

When you run a basic `sed` command, it will _autoprint_ the pattern space (a
line of input) once it is done running the script against it. That means every
line will get sent to stdout.

You can supress the autoprint functionality with the `-n` flag like so:

```bash
$ seq 100 | sed -n 's/1$/one/'
```

You can then add the `p` flag to the end of the substitute command to tell it
to _print_ any line that was affected by that substitution after the
substitution has been applied.

```bash
$ seq 100 | sed -n 's/1$/one/p'
one
1one
2one
3one
4one
5one
6one
7one
8one
9one
```

For all numbers between 1 and 100, this matches those that end in `1` and
substitutes that `1` for `one`. And then it is only those lines that go to
stdout.

If you used the `p` flag without `-n`, every line would autoprint and then
you'd get duplicate output for each line that had a substitution.

See `man sed` for more details.
