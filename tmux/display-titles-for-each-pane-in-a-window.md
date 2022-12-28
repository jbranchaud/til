# Display Titles For Each Pane In A Window

One of the main reasons I use `tmux` is to be able to organize the various
development servers and tools I have to run for a given project. They can be
spread across several windows in the same session. Or for ease of access, they
can all be split across panes in a single window.

In that latter case, I recently ran into an issue where the server output in
each pane looked similar enough that I couldn't tell which was which. What I
need is titles for each pane that tell me what is running and where.

`tmux` has pretty solid support for just this out-of-the-box with
`pane-border-status`.

Hit `<prefix>:` to issue the following command to `tmux`:

```
:set pane-border-status top
```

Or issue the command from one of your pane's terminal prompts:

```
$ tmux set pane-border-status top
```

Either way, it will replace the top border line with text telling you the pane
number, the directory, and the last run command in that pane. This is just the
context I need to differentiate each.

This will only set it for the current window.

If you want to turn it back off:

```
:set pane-border-status off
```

[source](https://stackoverflow.com/a/37602055/535590)
