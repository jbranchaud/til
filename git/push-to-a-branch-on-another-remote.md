# Push To A Branch On Another Remote

The kind of `git-push` I do most often is:

```bash
$ git push origin HEAD
```

which I have aliased to `put` in my `.gitconfig`.

`HEAD` generally refers to whatever branch you currently have checked out. So
this command will take the state of your current branch and push it to the
branch of the same name on the `origin`, which is a _remote_ (see `git remote
-v`).

If you have other remotes set up, such as a `staging`, `heroku`, etc., then you
may instead want to push to one of those.

```bash
$ git push heroku HEAD
```

This will push the state of the current branch to that branch on the `heroku`
remote.

If I instead want to push the changes from one local branch to a different
named remote branch, then I have to specify both like so:

```bash
$ git push heroku staging:main
```

This will push the state of my local `staging` branch to the `main` branch on
the `heroku` remote.

[source](https://devconnected.com/how-to-push-git-branch-to-remote/)
