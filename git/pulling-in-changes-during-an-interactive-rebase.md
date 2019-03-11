# Pulling In Changes During An Interactive Rebase

My standard workflow when doing feature development is to checkout a feature
branch and commit changes as I go. When the feature is finished, I clean up
the commit history with an interactive rebase and then integrate those
changes with `master`.

I initiate the interactive rebase like this (while on the feature branch):

```
$ git rebase -i master
```

This allows me to squash, fixup, and delete commits that I've made since
checking out this branch from `master`.

It is important to note that an another thing will happen seemingly behind
the scenes. Any commits on `master` since the feature branch was checked out
will be applied to the feature branch before the effects of the interactive
rebase are applied.

If you want to strictly do an interactive rebase of the commits on the
feature branch ignoring what is on `master`, then reference the commit you
checked out from -- put another way, reference the commit before the first
commit on this branch.

```
$ git rebase -i <sha-of-first-commit-on-this-branch>~
```

The tilde (`~`) will go back one commit from the specified commit sha.

See `man git-rebase` for more details.
