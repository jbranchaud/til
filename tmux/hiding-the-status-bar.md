# Hiding The Status Bar

The tmux status bar is a great place to show information about your tmux
session as well as things like the time and date. Sometimes you just want to
hide it though. This command will help.

```
:set -g status off
```

Hit enter and it is gone. If you want to show the status bar again, simply
turn it back on.

```
:set -g status on
```

[source](https://superuser.com/questions/265320/disable-the-status-bar-in-tmux)
