# Print Out File With Bat Without Formatting

The [`bat`](https://github.com/sharkdp/bat) utility is my daily driver and
replacement for anything used `cat` for before. I even have `bat` aliased to
`cat` so that I never had to rewire my muscle memory for typing `cat`.

Whether or not the creator of `cat` intended it, I'd guess that most terminal
users' main use case is printing the contents of a file. `bat` does that way
better with syntax highlighting, line numbers, and some layout formatting that
puts lines around the output and a heading with the filename.

All this formatting is great when I'm taking a quick look at a file. One way it
gets in the way is when I'm trying to highlight and copy a few lines to my
clipboard. Because the terminal is rendering lines, line numbers, and other
formatting, all that fluff gets included on the clipboard.

For this scenario, I can use the `-p` flag (or `--style=plain`) to print just
the (syntax-highlighted) file contents without all the extra formatting.

```bash
bat -p app/models/users.rb

# or
bat --style=plain app/models/users.rb
```

Another way I could have approached this was to [ignore the alias of `cat` to
`bat`](ignore-the-alias-when-running-a-command.md).
