# Check If Command Is Executable Before Using

When writing a quick bash script, you may want to check if a command exists and
is executable before trying to call it. This can be done with `command`, a builtin shell command, and the `-v` flag.

> If the -V or -v option is supplied, the exit status is 0 if command was found, and 1 if not.

Knowing that, we can redirect the output of the command to `/dev/null` and then
short-circuit executing the command if it's not available.

```bash
command -v pbcopy >/dev/null 2>&1 && echo 'something' | pbcopy
```

In this example, I execute the `pbcopy` command, which copies text to my system
clipboard, only if that command is available and executable.

See `man bash` and find the listing for `command` for more details.
