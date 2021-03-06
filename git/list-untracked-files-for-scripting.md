# List Untracked Files For Scripting

You'll generally run `git status` to get an overview of the index and working
tree of a git project. This is a _porcelain_ command meant for a Git end-user.
If you want to do some scripting, you'll want a _plumbing_ command like
`ls_files`.

The `git ls-files` command will

> Show information about files in the index and the working tree

This command can be used to list all untracked files in the working tree with
two flags.

1. The `--others` flag will show untracked files in the output
2. The `--exclude-standard` will use the standard ignore files like
   `.gitignore` and `.git/info/exclude`.

Put it all together and you've got:

```bash
$ git ls-files --others --exclude-standard
```

In [Make One-Line Commands Interactive with
fzf](https://www.youtube.com/watch?v=wf5eXdwfVws), I show how to use this with
`fzf` to interactively remove untracked files that are no longer wanted.

[source](https://stackoverflow.com/a/3801554/535590)
