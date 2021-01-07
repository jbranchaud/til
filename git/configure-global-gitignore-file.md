# Configure Global gitignore File

There are some files that you know you'll never want tracked by git. You don't
even want them showing up as an option. For these files, it can be nice to
specify them in a global `.gitignore` file. Then you don't need to specify them
for each project.

This can be configured in `~/.gitconfig` under the `core` settings as
`excludesFile`.

```
[core]
	excludesFile = ~/.gitignore
```

Then, create `~/.gitignore` (that's as good a place as any to put it).

```
# global .gitignore
.DS_Store
wip_notes.md
```

You'll now notice that for any git project, the files you listed won't be
showing up in the untracked list.

You can also add this to your `~/.gitconfig` with this one-line command.

```bash
$ git config --global core.excludesfile ~/.gitignore
```

See `man git-config` and search `core.excludesFile` for more details.
