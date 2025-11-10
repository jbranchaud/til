# Show Summary Stats For Current Branch

When I push a branch up to GitHub as a PR, there is a part of the UI that shows
you how many lines you've added and removed for this branch. It bases that off
the target branch which is typically your `main` branch.

The `git diff` command can provide those same stats right in the terminal. The
key is to specify the `--shortstat` flag which tells `git` to exclude other diff
output and only show:

- Number of files changed
- Number of insertions
- Number of deletions

Here is the summary stats for a branch I'm working on:

```bash
❯ git diff --shortstat main
 8 files changed, 773 insertions(+), 25 deletions(-)
```

We have to be on our feature branch and then we point to the branch (or whatever
ref) we want to diff against. Since I want to know how my feature branch
compares to `main`, I specify that.

See `man git-diff` for more details.
