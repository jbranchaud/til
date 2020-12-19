# Change The Default Prefix Key

The _prefix_ key for tmux is a key that tells an active tmux session that the
following key should be interpreted as a tmux command instead of regular input
to the terminal.

By default, tmux has `Ctrl-b` bound to the prefix.

So, hitting `Ctrl-b` followed by `?` will open up the tmux help.

Typing `Ctrl-b` involves a bit of a finger stretch. It can be changed to
something more comfortable. My personal preference is `Ctrl-z`. Many
configurations I've seen use `Ctrl-a`.

To change this, open up your `~/.tmux.conf` file and add two lines.

```
unbind C-b
set -g prefix C-z
```

And then run `:source-file ~/.tmux.conf`.

This tells tmux to unbind `Ctrl-b` so that it no longer is interpreted as the
prefix, and then it binds `Ctrl-z` as the new prefix key.
