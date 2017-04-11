# Cherry Pick A Range Of Commits

Git's `cherry-pick` command allows you to specify a range of commits to be
cherry picked onto the current branch. This can be done with the `A..B`
style syntax -- where `A` is the older end of the range.

Consider a scenario with the following chain of commits: `A - B - C - D`.

```bash
$ git cherry-pick B..D
```

This will cherry pick commits `C` and `D` onto `HEAD`. This is because the
lower-bound is exclusive. If you'd like to include `B` as well. Try the
following:

```bash
$ git cherry-pick B^..D
```

See `man git-cherry-pick` for more details.
