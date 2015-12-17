# Move The Latest Commit To A New Branch

I sometimes find myself making a commit against the `master` branch that I
intended to make on a new branch. To get this commit on a new branch, one
possible approach is to do a reset, checkout a new branch, and then
re-commit it. There is a better way.

```bash
$ git checkout -b my-new-branch
$ git checkout - 
$ git reset --hard HEAD~
```

This makes better use of branches and avoids the need to redo a commit that
has already been made.

Note: The example was against the `master` branch, but can work for any
branch.
