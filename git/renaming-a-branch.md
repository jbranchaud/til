# Renaming A Branch

The `-m` flag can be used with `git branch` to move/rename an existing
branch. If you are already on the branch that you want to rename, all you
need to do is provide the new branch name.

```bash
$ git branch -m <new-branch-name>
```

If you want to rename a branch other than the one you are currently on, you
must specify both the existing (old) branch name and the new branch name.

```bash
$ git branch -m <old-branch-name> <new-branch-name>
```

h/t Dillon Hafer
