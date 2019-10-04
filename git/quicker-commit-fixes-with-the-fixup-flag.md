# Quicker Commit Fixes With The Fixup Flag

Imagine you're working a feature branch and realize that the first commit you
made had a typo. You could just tack on another commit to fix the typo, but
that will add noise to your commit history. You can fix it up by making a
_fixup_ commit.

1. Make your typo fix
2. Stage the fix
3. Find the SHA of the commit that you want to fix (e.g. `2ee53ad`)
4. Create a _fixup_ commit: `git commit --fixup 2ee53ad`

This _fixup_ commit is tied to the original commit it is fixing.

```
❯ git log --pretty=oneline --abbrev-commit
b4258b6 (HEAD -> feature-branch) fixup! Add header
9c0d2b0 Different atomic change
2ee53ad Add header
8486b91 (master) Initial commit
```

To then apply the _fixup_, run `git rebase -i --autosquash master`. This will
present you with the following _interactive rebase_ screen:

```
pick 2ee53ad Add header
fixup b4258b6 fixup! Add header
pick 9c0d2b0 Different atomic change

# Rebase 8486b91..b4258b6 onto 8486b91 (3 commands)
```

Because git knows that your _fixup_ commit is tied to `2ee53ad`, it
automatically moves it into place below that commit with the `fixup` command.

Saving will apply and autosquash the fixup commit leaving you with a clean
commit history.
