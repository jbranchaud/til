# Distinguish Sessions With Different Colors

I sometimes have several Claude Code sessions open at once. As I bounce between
tmux windows, it can sometimes be tricky to tell them apart at a glance. One way
that Claude Code can help with this is with some light styling. You can change
the accent color of a session with the `/color` command.

Run it as is and it will choose a random color to set the session to.

Or you can pick from any of the available colors which it will give you a hint
for if you type a space after `/color`.

```
/color [red|blue|green|yellow|purple|orange|pink|cyan|default]
```

I can run the following to set it to cyan:

```
/color cyan
```

More details on this kinds of commands can be found in the [_Commands_
docs](https://code.claude.com/docs/en/commands).
