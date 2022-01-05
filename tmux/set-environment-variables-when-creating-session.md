# Set Environment Variables When Creating Session

In [Set Session-Specific Environment
Variables](set-session-specific-environment-variables.md), I showed how env
vars that are scoped to a tmux session can be set in an existing session.

It is also possible to set any number of environment variables when creating a
session. This is particularly handy if you are scripting the setup of various
tmux environments.

A base command to start a tmux session might look like this:

```bash
$ tmux new -s my-project
```

To set environment variables on that session, use one or more `-e` flags
followed by the name and value.

```bash
$ tmux new -s my-project -e EDITOR=code -e PG_VERSION=13.4
```

See `man tmux` for more details.
