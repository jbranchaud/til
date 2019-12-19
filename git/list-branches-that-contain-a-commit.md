# List Branches That Contain A Commit

You know a certain change made it onto the main branch. You'd like to know if
that changes has been integrated back into the development and staging
branches. If you have a specific git sha associated with that change, there is
a handy way to check.

```bash
$ git branch --contains 50e1151
```

The `--contains` flag of the
[`git-branch`](https://git-scm.com/docs/git-branch) command will list all
branches locally that contain the given commit sha.

If you don't see any output, then no branches have that sha. This means either there are remote changes that you need to pull down or you're looking at the wrong repo.

See `man git-branch` for more details.
