# Get The Short Version Of The Latest Commit

As part of some automated scripting for an app deployment I wanted to be
able to get the short version of the latest commit to the current git repo.
Git's `rev-parse` command is the perfect fit for this.

```bash
$ git rev-parse --short HEAD
708248b
```

See `man git-rev-parse` for more details.

[source](https://stackoverflow.com/questions/5694389/get-the-short-git-version-hash)
