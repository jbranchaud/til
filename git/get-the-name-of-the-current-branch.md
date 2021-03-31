# Get The Name Of The Current Branch

There are a couple ways of doing this. If you are on Git 2.22+, then the
`git-branch` porcelain command now supports a flag for this.

```bash
$ git branch --show-current
main
```

If you are on an older version of Git or looking for a plumbing command that is
more appropriate for scripting, then `git-rev-parse` is what you're looking
for.

```bash
$ git rev-parse --abbrev-ref HEAD
main
```

[source](https://stackoverflow.com/questions/6245570/how-to-get-the-current-branch-name-in-git)
