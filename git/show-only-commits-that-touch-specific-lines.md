# Show Only Commits That Touch Specific Lines

When you run `git log`, you are listing all commits in reverse-chronological
order for the current branch. There are ways of filtering the commits that
get output from `git-log`. As of Git 1.8.4, `git-log` output can be filtered
by commits that touch a range of line numbers.

This is done with the `-L` flag.

For instance, if I want to see all commits that touched the 13th line of my
`README.md` file, then I can do this:

```bash
$ git log -L13,13:README.md
```

I can alter the command to show commits that touched a range of lines like
so:

```bash
$ git log -L19,45:README.md
```

I used the `-L` flag recently to find when a dependency was added to my
`package.json` file even though the most recent changes to that line were
version bumps.

[source](https://stackoverflow.com/questions/8435343/retrieve-the-commit-log-for-a-specific-line-in-a-file)
