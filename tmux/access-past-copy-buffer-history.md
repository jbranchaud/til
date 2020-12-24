# Access Past Copy Buffer History

Each time you perform a copy (as in copy/paste) within tmux using its built-in
copy functionality (i.e. `set-buffer` and `save-buffer`), the text that you
copied to the buffer is recorded in the server's history.

_Note: you may have `Cmd-c` or the mouse configured to copy to a tmux buffer._

So, while `tmux paste-buffer` (or `Cmd-v` if you have that configured) will
only paste in the most recently copied value to a tmux buffer, you can still
access more of the history.

Run `tmux choose-buffer` (or `<prefix>:choose-buffer`) to open an interactive
prompt that lists the tmux buffer history in reverse chronological order (most
recent to oldest).

You can navigate up and down through these buffers until you find the one that
contains what you're looking for. Then hit `Enter` and the value will be pasted
to the current window and pane.

See `man tmux` and search for `choose-buffer` for more details.
