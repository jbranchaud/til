# Run A Git Command From Outside The Repo

Generally you run a git command from somewhere within the parent folder where
the `.git` directory lives. Git recognizes the `.git` directory in that parent
directory and runs your command against it.

You can run a command against a given git repository without being within the
parent directory. This can be handy for scripting as well as for one-off
commands when you don't want to `cd` to the directory. To do this, you need to
tell Git where to find the `.git` directory. You do this with the `-C` flag.

For instance, from anywhere on my machine, I can view a log of this TIL
repository with the following:

```bash
$ git -C ~/code/til log
```

Notice that the `-C` flag and its argument are positioned directly after `git`.
The command (`log`) should be positioned after that.

See `man git` for more details.

[source](https://stackoverflow.com/a/35899275/535590)
