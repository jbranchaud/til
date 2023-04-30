# Run A Command Repeatedly Several Times

From the terminal in a Bash or Zsh shell session, I can loop on a command to
have it run a specific number of times.

If I want to run a test command (e.g. `bin/test some_file.spec:123`) 12 times
in a row, I could use a for loop like so:

```bash
for i in {1..12}; do bin/test some_file.spec:123; done
```

And the shell will run the command one time after another until it has been run
12 times. That range `{1..12}` can be adjusted to whatever I want. For
instance, to have it loop 3 times, I'd make it into `{1..3}`.

[source](https://serverfault.com/questions/273238/how-to-run-a-command-multiple-times-using-bash-shell)
