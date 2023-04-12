# Change Base Directory Without Detaching

In [Change Base Directory Of Existing
Session](change-base-directory-of-existing-session.md), I described how you can
detach from an existing tmux session and re-attach with a new base directory
specified.

We can do nearly the same thing within the current tmux session without first
detaching. The command is going to look much the same, but we will execute it
from the tmux command prompt.

Start the prompt by hitting `<prefix>:` and then enter the following command:

```
:attach-session -t . -c /path/to/base/directory
```

Here the `-t` specifies what session we are going to attach to. By giving it
`.`, we tell it that we want to attach to the current session. The `-c`
specifies our new base directory.

Hit enter and then try opening a new window or pane to see that the new base
directory has taken effect.

[source](https://stackoverflow.com/questions/27307815/how-do-i-change-the-starting-directory-of-a-tmux-session#comment99821047_54444853)
