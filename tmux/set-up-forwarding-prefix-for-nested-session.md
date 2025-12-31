# Set Up Forwarding Prefix For Nested Session

I use
[`ctrl-z`](https://github.com/jbranchaud/dotfiles/blob/main/config/tmux/tmux.conf#L57)
(instead of `ctrl-b`) for my tmux prefix key. I also have [`ctrl-z
ctrl-z`](https://github.com/jbranchaud/dotfiles/blob/main/config/tmux/tmux.conf#L138-L139)
configured to toggle back and forth between the previously visited window.

With that in mind, I needed to set up a specific keybinding to send the prefix
key to an inner (nested) tmux session. That's because sometimes, like with a
tool such as `overmind`, you can end up connected to a tmux session while
already within a tmux session.

So, I have `Ctrl-z a` send the prefix key to the inner tmux session. This is
what I added to my
[`tmux.conf`](https://github.com/jbranchaud/dotfiles/blob/main/config/tmux/tmux.conf#L167-L168):

```
# send prefix to inner tmux session (C-z a)
bind-key a send-prefix
```

Simply doing `Ctrl-z d` will detach me from the outer tmux session. If I want to
detach from an inner tmux session, I can use my new keybinding -- `Ctrl-z a d`.
