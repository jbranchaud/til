# Use External Diff Tool Like Difftastic

Assuming we already have a tool like `difft`
([difftastic](https://difftastic.wilfred.me.uk/introduction.html)) available on
our machine, we can use it as a diff viewer for the various `git` commands that
display a diff.

This requires a manual override which involve two pieces — an inline
configuration of `diff.external` specifying the binary of the external differ
and the `--ext-diff` flag which tells these commands to use the external diff
binary.

Here is what `git show` looks like with `difft`:

```bash
$ git -c diff.external=difft show --ext-diff
```

Without the `--ext-diff` flag, it will fallback to the default differ despite
`diff.external` being set.

See `man git-diff` and friends for the `--ext-diff` flag. See `man git-config`
for `diff.external`.
