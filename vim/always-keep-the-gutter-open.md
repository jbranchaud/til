# Always Keep The Gutter Open

Vim has an area off to the left where it can display information for specific
lines in a buffer. This is sometimes called the gutter or the tray. In the Vim
help files it is called the `signcolumn`. That names makes sense. It is a
column to the left of the line numbers where _signs_ can be shown to indicate
git status, type errors, and lint warnings.

By default, the `signcolumn` is set to `auto` which means that as a sign
appears, the column shifts open moving the editor text with it. When you've
resolved whatever cause the sign to disappear, everything will shift back to
the left.

This jumpy layout shift can be avoiding by keeping the `signcolumn` always
open. That's done by setting it to `yes` in your `~/.vimrc`.

```vim
set signcolumn=yes
```

See `:h signcolumn` for more details.
