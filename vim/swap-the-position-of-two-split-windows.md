# Swap The Position Of Two Split Windows

A Vim workflow that I often end up in is one where I have two windows split
either vertically or horizontally. I'm usually editing in one side of the split
and referencing something from the other side of the split.

I typically like to have the split them I'm editing in on the top or to the
left. If the split that I want to edit from ends up in the bottom or to the
right, I can swap its position with the other window using one of Vim's window
commands. These are typically prefixed with `Ctrl-w`.

Swapping the position of two windows is the same as rotating them, either to
the left or to the right. In that case, I can use either of these commands:

```
Ctrl-w Ctrl-r # rotates windows downwards/rightwards
Ctrl-w r      # rotates windows upwards/leftwards
```

See `Ctrl-W_Ctrl-R` for more details.
