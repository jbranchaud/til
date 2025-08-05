# Clear Entries From Git Stash

I often stash changes as I'm moving between branches, rebasing, or pulling in
changes from the remote. Usually these are changes that I will want to restore
with a `git stash pop` in a few moments.

However, sometimes these stashed changes are abandoned to time.

When I run `git stash list` on an active project, I see that there are nine
entries in the list. When I do `git show stash@{0}` and `git show stash@{1}` to
see the changes that comprise the latest two entries, I don't see anything I
care about.

I can get rid of those individual entries with, say, `git stash drop
stash@{0}`.

But I'm pretty confident that I don't care about any of the nine entries in my
stash list, so I want to _clear_ out all of them. I can do that with:

```bash
$ git stash clear
```

Now when I run `git stash list`, I see nothing.

See `man git-stash` for more details.
