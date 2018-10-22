# Show What Is In A Stash

Usually when I want to inspect anything in git, I'll use `git show` with a
specific ref. This can even be done with stash refs.

```bash
$ git stash list
stash@{0}: WIP on ...
stash@{1}: Some commit on ...

$ git show stash@{0}
# ...
```

The `git-stash` command has a built-in way of showing stashes that will save
you from having to type out the somewhat awkward `stash@{n}` ref.

```bash
$ git stash show 1
```

This will show you the `stash@{1}` ref. You can also omit a number which
will show you the latest stash (`stash@{0}`).

See `man git-stash` for more details.
