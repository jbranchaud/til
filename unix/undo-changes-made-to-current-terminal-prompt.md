# Undo Change Made to Current Terminal Prompt

I frequently use a variety of ASCII command characters like `ctrl-u` to delete
the entire line or `ctrl-a` to jump to the front of a long line so I can make
some edits toward that side of the command or `ctrl-e` to jump to the end of
the command for the same reason. I sometimes even use `ctrl-k` to delete
everything after the cursor to the end of the line.

What I didn't realize until now is that any of those commands the modify the
current line of the termianl prompt plus regular typing and hitting the
backspace are all _undoable_.

So, if I just wiped out half the line (with `ctrl-k`) and I immediately regret
it, I can restore it with `ctrl-_`. The system keeps of history of the actions
you've taken, so you can keep hitting `ctrl-_` to undo even further.

The `ctrl-/` command does the same, per GNU's [Undo Changes in the Emacs
docs](https://www.gnu.org/software/emacs/manual/html_node/emacs/Basic-Undo.html).

[source](https://jvns.ca/ascii)
