# Blank Lines Above And Below

Generally when I want to add a line above or below the line that the cursor
is on, I use `O` and `o`, respectively. This has a couple potential
drawbacks. First and most prominent, the cursor is moved to the new line and
left in insert mode. Usually, I'd like to remain in normal mode and stay on
the current line. Second, these commands will emulate indentation and other
formatting rules. This is either exactly what you want or a bit of an
annoyance.

The [`vim-unimpaired` plugin](https://github.com/tpope/vim-unimpaired)
provides an alternative worth adding to your toolbelt. By hitting `[<space>`
and `]<space>`, a new line will be opened above and below the current line,
respectively. Additionally, it leaves you in normal mode, keeps the cursor
on the current line, and moves the cursor to the first non-indented
character. In the case of performing this command in the midst of a comment
in a source code file, neither the indentation nor the comment character
will be propagated onto the new line.

Hold on to `O`/`o` and `[<space>`/`]<space>` and know the difference. You'll
likely need each of them from time to time.

h/t Josh Davey
