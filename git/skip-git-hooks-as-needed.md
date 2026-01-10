# Skip Git Hooks As Needed

Projects have Git hooks configured for all sorts of reasons. Most common are
`pre-commit` hooks which verify certain aspects of the contents of a commit.
A `pre-commit` hook could check that the tests all pass, that the changes don't
include any debugging statements, and so forth. There are all kinds of hooks
though, like `pre-rebase` and `post-checkout`.

These hooks can sometimes get in the way and we may need to skip or disable them
on a one-off basis.

Several Git commands offer a `--no-verify` flag which can skip running the hook
associated with that command.

- `git commit --no-verify` (skips `pre-commit` and `commit-msg` hooks)
- `git push --no-verify` (skips `pre-push` hook)
- `git merge --no-verify` (skips `pre-merge-commit` hook)
- `git am --no-verify` (skips `applypatch-msg` and `pre-applypatch` hooks)

If you look in the `.git/hooks` directory, there are several other hooks not
covered by the above. So, what if I am doing an action like `git checkout` and I
want to skip the `post-checkout` hook?

I can override the `hooksPath` config for that one command with the `-c` flag.

```sh
$ git -c core.hooksPath=/dev/null checkout ...
```

By setting it to `/dev/null`, it will find *no* hooks available, so none will be
executed for this command.

See `man git-config` for more details on `core.hooksPath`.
