# Remove The Delay On The Escape Key

By default, tmux imposes a 500ms delay on presses of the escape key. This is in
case the escape key is used as part of a tmux key binding.

I don't use the escape key for any of my tmux key bindings, but I do use the
escape key quite in other contexts, like Vim.

The 500ms delay on the escape key being registered in contexts like Vim is
annoying at best. This delay can be removed by overriding the `escape-time`
option.

```
set -sg escape-time 0
```

Adding this line to your `~/.tmux.conf` file will set the delay to 0ms. The
`-s` and `-g` flags set the option for the _server_ and the _global server_
contexts respectively.
