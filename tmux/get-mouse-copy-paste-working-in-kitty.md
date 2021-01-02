# Get Mouse Copy/Paste Working In Kitty

With tmux's mouse mode enabled (`set-option -g -q mouse on`), you can use the
mouse to make a drag selection of some text. You can then paste it within a
tmux session using `Cmd+v`.

If you are using tmux within the [Kitty terminal
emulator](https://sw.kovidgoyal.net/kitty/), you'll get more text pasted than
you bargained for. Kitty's clipboard _appends_ by default. So after several
selections have made there way into tmux's buffer history, a paste will result
in all of those buffers values being appended together and output to the
terminal.

To fix this, you need to change Kitty's clipboard to be `no-append`.

```
# ~/.config/kitty/kitty.conf
clipboard_control write-clipboard write-primary no-append
```

[source](https://github.com/kovidgoyal/kitty/issues/782#issuecomment-502927322)
