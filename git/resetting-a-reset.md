# Resetting A Reset

Sometimes we run commands like `git reset --hard HEAD~` when we shouldn't
have. We wish we could undo what we've done, but the commit we've *reset* is
gone forever. Or is it?

When bad things happen, `git-reflog` can often lend a hand. Using
`git-reflog`, we can find our way back to were we've been; to better times.

```bash
$ git reflog
00f77eb HEAD@{0}: reset: moving to HEAD~
9b2fb39 HEAD@{1}: commit: Add this set of important changes
...
```

We can see that `HEAD@{1}` references a time and place before we destroyed
our last commit. Let's fix things by resetting to that.

```bash
$ git reset HEAD@{1}
```

Our lost commit is found.

Unfortunately, we cannot undo all the bad in the world. Any changes to
tracked files will be irreparably lost.

[source](http://stackoverflow.com/questions/2510276/undoing-git-reset)
