# Look Through All Files That Have Been Git Stashed

When I use `git stash`, I typically _pop_ the stash not long after to continue
working with those changes. Still, over time the stash list tends to build up,
especially if I'm bouncing between lots of different work.

I wired together a series of commands with the unix piping to make it easy to
explore the entire contents of the stash.

```bash
$ git stash list \
  | awk -F: '{print $1}' \
  | xargs -I stash-ref git stash show stash-ref --name-only \
  | sort \
  | uniq
```

That "one-liner" on its own gives me a uniq list of all files across all my
stashes in the current git repo.

I can then explore it by tacking on something like `fzf` or `grep`:

```bash
$ git stash list \
  | awk -F: '{print $1}' \
  | xargs -I stash-ref git stash show stash-ref --name-only \
  | sort \
  | uniq \
  | grep '.*.md'
```
