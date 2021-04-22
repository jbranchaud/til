# Set The Title Of A Window

Kitty, I believe by default, will set the title of the current window to a
previous run command.

For instance, I often start out my terminal session by running a `tmux` command
to create or join a tmux session. After this, the title of the window ends up
sticking as something like `tmux new -s my-project`.

Because I switch between various projects, I'd prefer the window title be
something more generic. The window title can be manually set. To do this, open
a 'New OS Window'—either from the menu or by hitting `Cmd-N`.

Then run a `set-window-title` command with `kitty`.

```bash
$ kitty @ set-window-title --match id:1 code
```

The `--match id:1` tells `kitty` what window to target with this command.
Because I only ever keep one window open, the `id` of that window is always
`1`. If you're not sure which window `id` to target, you can list the windows
and find the one you are looking for.

```bash
$ kitty ls
```

[source](https://sw.kovidgoyal.net/kitty/remote-control.html#kitty-set-window-title)
