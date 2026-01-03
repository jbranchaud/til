# Display Line Numbers While Using Less

Including line numbers while viewing files with `less` can provide useful
context for understanding where you are within the file. This is especially true
if you've used `&` to filter down to lines that match a pattern.

You can start `less` with line numbers with the `-N` flag (or `--LINE-NUMBERS`
if you really want to spell it out).

```bash
$ less -N log/development.log
```

If you've already started up `less` and wish you had included line numbers,
there is no reason to restart it with the flag. Instead, toggle the line numbers
option on within the `less` process. To do this, type `-N`. It will prompt you
with `Constantly display line numbers (press RETURN)`. Hit enter and line
numbers will appear to the left of each line in the file.

Similarly, to toggle line numbers back off within `less`, hit `-n` (lower-case
`n`), accept the prompt, and back off they go.

Both of these (`-N`/`-n`) are options being set (toggled) via the `-` command.
There are many other options like these that can be configured within a `less`
session in the same way.

See `man less` and find the `-` command and the available `OPTIONS`.
