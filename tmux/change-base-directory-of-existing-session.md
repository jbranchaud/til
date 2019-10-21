# Change Base Directory Of Existing Session

Each tmux session has a base directory. This is determined when you first
create the session. When you open a new window or pane, this will be used as
the base directory of your new shell session.

You can change the base directory of an existing tmux session.

First, detach from the session: `<prefix>d`

Then, re-attach using the `-c` flag:

```bash
$ tmux attach -t your-session-name -c /new/base/dir
```

[source](https://stackoverflow.com/a/36435535/535590)
