# Backspace Options

The `backspace` option determines the behavior of pressing the backspace key
(`<BS>`). By default, Vim's `backspace` option is set to an empty list.
There are three values that can be added that each independently alter the
behavior of the backspace key. These are `indent`, `eol`, and `start`.

When `indent` is included, you can backspace over indentation from
`autoindent`. Without it, Vim will not allow you to backspace over
indentation.

When `eol` is included, you can backspace over an end of line (eol)
character. If the cursor is at the first position of a line and you hit
backspace, it will essentially be joined with the line above it. Without
`eol`, this won't happen.

When `start` is included, you can backspace past the position where you
started Insert mode. Without `start`, you can enter Insert mode, type a bit,
and then when backspacing, only delete back as far as the start of Insert
mode.

The `backspace` default is absurd, you are going to want to add all of the
above to your Vim settings.

See `:h 'backspace'` for more details.
