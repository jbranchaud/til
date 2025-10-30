# Add Bindings To Split Panes To Current Directory

When I am vertically or horizontally splitting a pane or opening another window,
I generally want it to open to the same directory as I'm currently in. The
default behavior in tmux is for those commands to open to the starting directory
of the session.

Looking through the [tmux.conf in
dkarter/dotfiles](https://github.com/dkarter/dotfiles/blob/master/config/tmux/tmux.conf#L109-L111),
I found a good way to achieve the behavior I want.

```
bind-key - split-window -v  -c '#{pane_current_path}'
bind-key \\ split-window -h  -c '#{pane_current_path}'
bind-key c new-window -c '#{pane_current_path}'
```

What I like about this is that `-` (vertical) and `\` (horizontal) look visually
like the splits they represent. Meanwhile, I leave `%` and `"` intact.
