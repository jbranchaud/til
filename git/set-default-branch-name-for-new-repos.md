# Set Default Branch Name For New Repos

When you run `git init` in a directory, it will initialize that directory as a
`git` repository. The default branch name for any new git repository is
`master`. A better name for the base branch would be something like `main`.

To set `main` as the new default for all new repos, you can run the following
`git` command.

```bash
$ git config --global init.defaultBranch main
```

This will update your `.gitconfig` file to contain the following lines.

```
[init]
	defaultBranch = main
```

Try running `git init` in a fresh directory and then `git branch
--show-current` to see that the base branch is now defaulting to `main`.
