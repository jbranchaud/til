# Find The Date That A File Was Added To The Repo

The `git log` command has a bunch of flags that you can use to filter
commits and format their output.

We can get `git log` to only show the date for a commit in the `short`
format with the following flags:

```bash
$ git log --pretty=format:"%ad" --date=short
```

We can also get `git log` to filter commits to just those that have files
being added:

```bash
$ git log --diff-filter=A
```

Like many `git` commands, we can restrict the output to those that match a
path or file.

```bash
$ git log -- README.md
```

If we put all of these together, then we have a one-line command for getting
the date a specific file was added to the repository:

```bash
$ git log --pretty=format:"%ad" --date=short --diff-filter=A -- README.md
2015-02-06
```

See `man git-log` for more details.
