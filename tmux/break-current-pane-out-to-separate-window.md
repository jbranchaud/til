# Break Current Pane Out To Separate Window

You have a split pane open in your current window. Perhaps it is running a
local server or has a connection to a database. The pane is taking up too
much space in the current window, but it is important so you don't want to
just kill it. If that is the case, break it out into a separate window.

With that pane in focus, enter into command mode (`<prefix>:`) and then issue
the `break-pane` command.

Alternatively, you can trigger this with a keybinding: `<prefix>!`.

See `man tmux` for more details.
