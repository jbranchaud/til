# Configuring The Pager

When you run Git commands that produce a bunch of output, Git will use a
pager to present the content starting at the beginning, rather than spitting
it all out to the screen at once. This will almost always come in handy for
commands like `git-diff` and `git-log`.

By default, Git uses `less` as its pager.

You can also choose to configure it to something else by updating your git
config file or by running the following command:

```bash
$ git config --global core.pager 'more'
```

If you'd like to turn the pager off altogether, set it to a blank string.

```bash
$ git config --global core.pager ''
```

[source](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
