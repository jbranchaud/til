# Check What Branches Contain A Specific Commit

The `git branch` command comes with a `--contains` flag that can tell me what
local branches contain a specific commit based on the SHA of that commit.

```bash
❯ git branch --contains a73d9173c2399069fa202fe65da0a8927814fd84
* main
  jb/migrate-to-basedpyright
  jb/migrate-date-files-to-repository-pattern
```

I am currently on the `main` branch which is why it shows the `*` next to that
one. This SHA also appears on those other two branches.

This command could be useful in a variety of situations.

1. If I'm looking at a commit on a branch and I cannot remember if it has been
   integrated upstream yet. This check could tell me (unless commit squashing
   happens).
2. If I'm on `main`, as I was above, and I am trying to remember what branch
   introduced a commit, this can help with that sleuthing. This assumes I don't
   delete branches.
3. Maybe I've just run a `git bisect` to track down a bad commit and I want to
   see what are all the local branches that are impacted.

See `man git-branch` for more details.
