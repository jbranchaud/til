# Transition A Branch From One Base To Another

Let's say I'm working in a git workflow where we have `main` as our production
branch and `dev` as our development branch. I've opened a feature branch off of
`main` and made a series of commits. It is at that point that I realize I
should instead be branched off `dev`. I could open up a new branch off `dev`
and then `cherry-pick` those commits. That is messier and more steps than
necessary.

Instead, I can transition the feature branch I'm already working from to a
different base.

The [`git-rebase`](https://git-scm.com/docs/git-rebase) command supports this
with the `--onto` flag.

```bash
$ git rebase --onto dev main my-feature-branch
```

Specify the new base branch (`dev`), the current base (`main`), and then the
name of the branch you are transitioning (`my-feature-branch`).

[source](https://stackoverflow.com/a/10853956/535590)
