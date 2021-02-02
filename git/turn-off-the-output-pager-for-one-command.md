# Turn Off The Output Pager For One Command

With `git` a pager, such as `less`, can be configured to display paginated
command output. There are many ways to set up the default pager such as setting
the `core.pager` value in your git-config or by setting the `$PAGER` env var.

Assuming it is set to something like `less`, you can view, scroll through, and
search the output of a command like `git log` or `git diff`. When you're
finished the pager will close, all the output will vanish, and you'll be back
at your terminal prompt.

This is generally a desirable workflow. If, however, you want to be able to
scroll back in your terminal history to reference a SHA or a commit message,
you'll be disappointed.

For one off commands where you know you'll want the output actually printed to
the terminal, you can turn off the pager with the `--no-pager` flag (or `-P` as
a shorthand).

```bash
$ git --no-pager show
```

This will print the details of the HEAD commit to the terminal. I can scroll
back and reference them as needed.
