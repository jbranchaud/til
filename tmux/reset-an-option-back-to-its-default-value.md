# Reset An Option Back To Its Default Value

Once you start changing the values of options, tmux can be opaque about what
the original default values were.

For instance, if you change the `escape-time` option with the following
command:

```bash
$ tmux set-option -g escape-time 0
```

It's now set to `0`, so without digging through the tmux man pages, how do you
figure out what the default was and restore it?

The `set-option` command takes the `-u` flag to _unset_ the option. This will
restore it to the default.

```bash
$ tmux set-option -u escape-time
```

And you can now see the original default value with `show-option`.

```bash
$ tmux show-option escape-time
500
```

Use `set-option -u` with any option to restore it to its default.

Find `set-option` in `man tmux` for more details.
