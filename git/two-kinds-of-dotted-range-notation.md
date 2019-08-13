# Two Kinds Of Dotted Range Notation

There are two kinds of dotted range notation in git -- `..` and `...`.

If you'd like to view all changes on your current feature branch since checking
out from `master`, you can use the two-dot notation:

```bash
❯ git log master..some-feature-branch --oneline
9e50bff (some-feature-branch) Add second feature change
b11bb0b Add first feature change
```

You could also switch the refs around to see what has changed on master since
checking out:

```bash
❯ git log some-feature-branch..master --oneline
c2880f8 (HEAD -> master) Add description to README
```

Then there is the three-dot notation. This will include all commits from the
second ref that aren't in the first and all commits in the first that aren't in
the second.

```bash
❯ git log master...some-feature-branch --oneline
c2880f8 (HEAD -> master) Add description to README
9e50bff (some-feature-branch) Add second feature change
b11bb0b Add first feature change
```

See `man git-rev-parse` for more details.

[source](https://stackoverflow.com/a/24186641/535590)
