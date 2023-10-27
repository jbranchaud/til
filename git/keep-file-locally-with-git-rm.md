# Keep File Locally With `git rm`

Let's say I've added a new file `data.json` to my repo as part of the most
recent commit. I realize this isn't the point at which I want to add that file.
So, I do `git rm data.json` and then `git commit --amend` to rework that
commit.

However, when I look in my working tree, or even just my file system, I'll
notice that `data.json` is gone. The `git rm` command completely removed the
file since it was previously an untracked file.

To keep `git rm` from tossing out my file like that, I can include the
`--cached` flag which will remove the file from the index (stages it to be
`deleted`), but restore it to the working directory.

```bash
$ git rm --cached data.json
```

See `man git-rm` for more details on the `--cached` flag.
