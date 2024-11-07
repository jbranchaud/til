# Open New Splits To The Current Directory

I typically work in one project per tmux session. When I create a given tmux
session, the default directory is for that project. All new windows and pane
splits will open at that default directory. This generally is the default
behavior I want.

One caveat: I often open a new window within an existing session that I want
anchored to another directory. This could be because I'm working in a monorepo
and I need to work from a subdirectory for a specific package or app. Or it
could be that I'm temporarily digging into another project and it isn't worth
create a whole new session.

Regardless of the reason, I run into a bit of friction with tmux's defaults.

First I open the new window and `cd` to another project. After some working, I
need to open a split pane, maybe to run a project command like a build or dev
server. Hitting `prefix-"` (horizontal split) or `prefix-%` (vertical split)
opens a pane with the shell defaulting back to the original directory, not the
current directory.

The trick to fixing this bit of friction is overriding the directory of pane
splits. I can do that by adding the following to my `~/.tmux.conf`:

```
# Pane splits should open to the same path as the current pane
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
```

Make sure to run `tmux source-file ~/.tmux.conf` to apply these config changes.

The `pane_current_path` is called a "Format" in tmux parlance. It resolves to
the absolute path of the current pane's current directory. You can find all the
formats in the manpage with this command: `man tmux | less +'/^FORMATS'`. You
can also show yourself that this format resolves to what you expect by running
`tmux display-message -p '#{pane_current_path}'`.
