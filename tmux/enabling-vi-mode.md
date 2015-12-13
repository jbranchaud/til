# Enabling Vi Mode

If you'd like some vim-like bindings in tmux, you can turn on vi mode. To do
so, add the following line to your `.tmux.conf` file:

```
setw -g mode-keys vi
```

With this added and tmux re-sourced, you'll now have a variety of vi-like
bindings. For instance, when in tmux's copy mode, you can now use `v` to
begin making a visual selection and `y` to yank that selection into tmux's
copy buffer.
