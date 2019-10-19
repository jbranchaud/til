# Change The Start Point Of A Branch

More than a few times I have checked out a new branch against, say, `develop`
when I instead meant to base it off `qa`. I've tried what felt like the obvious
solution.

```bash
❯ git checkout qa
❯ git checkout -b new-branch
fatal: A branch named 'new-branch' already exists.
```

Git won't allow this. The fix I tend to go with is to delete the branch, move
to my intended starting point, and check it out anew.

Here is another approach. The `git checkout` command offers the `-B` flag which
will save me a step.

```bash
❯ git checkout -B new-branch
Switched to and reset branch 'new-branch'
```

Use this with caution. Any commits that have been applied to the subject branch
will be reset (read: wiped out) in the process.

See `man git-checkout` for more details.
