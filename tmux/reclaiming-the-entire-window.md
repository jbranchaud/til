# Reclaiming The Entire Window

If you have attached to a tmux session whose dimensions are being
constrained by another connection, you may find an L-shaped portion of your
window filled with dots. tmux defers to the session with smaller dimensions.
The easiest way to reclaim the entire window for your session is to attach
to the session while forcing all other sessions to detach. The `-d` flag will
help with that.

```bash
$ tmux attach-session -d -t my-session
```

By detaching all other sessions, you are ensuring that your machine's
dimensions are the ones that tmux uses when drawing the window. This is a
great quick fix if you're working on your own, but probably not what you
want to do if you are in a pair programming situation.

[source](http://stackoverflow.com/questions/7814612/is-there-any-way-to-redraw-tmux-window-when-switching-smaller-monitor-to-bigger)
