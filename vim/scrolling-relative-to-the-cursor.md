# Scrolling Relative to the Cursor

If you hit `zt` while in normal mode, the window will be redrawn such that
the line the cursor is positioned on is at the top of the window. Similarly,
if you hit `zb`, the window will be redrawn such that the line the cursor is
currently on will be at the bottom of the window.

The one that comes in really handy, though, is `zz` (note: this is not
`ZZ`) which will reposition the current line to the center of the screen.
This can come in really handy if you have scrolled to the top (or bottom) of
the visible part of the buffer and you want to quickly view more of the
context around the current line.

See `:h scroll-cursor` for more details and commands.
