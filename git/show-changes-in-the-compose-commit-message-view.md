# Show Changes In The Compose Commit Message View

When you execute `git commit`, you'll be dropped into your default editor
and prompted to compose a commit message. By default you'll only see the
status and names of the files involved in the commit.

To also see the line-by-line-changes in this view, you'll want to commit in
verbose mode.

```bash
$ git commit --verbose
```

You can also set verbose mode as the default by updating your `~/.gitconfig`
file.

```
[commit]
    verbose = true
```

[source](https://stackoverflow.com/questions/5875275/git-commit-v-by-default)
