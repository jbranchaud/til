# Check If A File Has Changed In A Script

If I'm at the command line and I want to check if a file has changed, I can run
`git diff` and see what has changed. If I want to be more specific, I can run
`git diff README.md` to see if there are changes to that specific file.

If I'm trying to do this check in a script though, I want the command to clearly
tell the script _Yes_ or _No_. Usually a script looks for an exit code to
determine what path to take. But as long as `git diff` runs successfully,
regardless of whether or not their are changes, it is going to have an
affirmative exit code of `0`.

This is why `git diff` offers the `--exit-code` flag.

> Make the program exit with codes similar to diff(1). That is, it exits with 1
> if there were differences and 0 means no differences.

With that in mind, we can wire up a script with `git diff` that takes different
paths depending on whether or not there are changes.

```bash
if ! git diff --exit-code README.md; then
  echo "README.md has changes"
else
  echo "README.md is clean"
fi
```

We can take this a step further and instead use the `--quiet` flag.

> Disable all output of the program. Implies --exit-code. Disables execution of
> external diff helpers whose exit code is not trusted

This exhibits the same behavior as `--exit-code` and goes the additional step of
silencing diff output and disabling execution of external diff helpers like
`delta`.

See `man git-diff` for more details.
