# Highlight Extra Whitespace In Diff Output

When running a `git diff` (or `git add --patch`) I'll sometimes come across
lines that don't have any visible changes. This is usually because some
whitespace characters were either added (on accident) or removed (often by a
autoformatter).

Depending on the `core.whitespace` config, you'll probably see at least some of
the whitespace errors that git provides. By default, git only highlights
whitespace errors on added (`new`) lines. However if some extra whitespace was
originally committed and is now being removed, it won't be highlighted on the
`old` line in the diff.

We can have git always highlight whitespace errors by setting
`wsErrorHighlight` to `all` in the global git config.

```bash
$ git config --global diff.wsErrorHighlight all
```

Which updates the global gitconfig file with the following line:

```
[diff]
	wsErrorHighlight = all
```

The `all` option is a shorthand for `old,new,context`.

See `man git-diff` for more details.
