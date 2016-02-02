# Find The Initial Commit

By definition, the initial commit in a repository has no parents. You can
exploit that fact and use `rev-list` to find the initial commit; a commit
with no parents.

```bash
$ git rev-list --max-parents=0 HEAD
```

The `rev-list` command lists all commits in reverse chronological order. By
restricting them to those with at most 0 parents, you are only going to get
root commits. Generally, a repository will only have a single root commit,
but it is possible for there to be more than one.

See `man git-rev-list` for more details.

[source](http://stackoverflow.com/questions/5188914/how-to-show-first-commit-by-git-log)
