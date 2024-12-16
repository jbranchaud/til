# Better Diffs With Delta

A `git diff` from the command line is relatively bare bones. It shows you
removed lines and added lines that make up a changeset with the former text in
red and the later text in green. All other contextual text is in white. I've
found this to be good enough for most of the life of my git usage. I've been
missing out though.

By using [`delta`](https://github.com/dandavison/delta) as the pager and diff
filter for `git`, I get a bunch of nice visual improvements.

- Removals and additions are red and green shaded backgrounds
- Syntax highlighting for most languages
- Highlight specific part of a line that has changed
- Visual spacing and layout is clearer

To get all of this, all I had to do was install `delta`:

```bash
$ brew install delta
```

And then add `delta` as both the _core_ pager and `diffFilter` in my global git
config file:

```
[core]
	pager = delta
[interactive]
	singleKey = true # unrelated, but nice to have
	diffFilter = delta --color-only
```

It's also recommended that you use `zdiff3` for your merge conflict style,
which I already had:

```
[merge]
	conflictstyle = zdiff3
```

Once you have ths all configred, try a `git diff` or `git add --patch` and see
how much more visual info you get.
