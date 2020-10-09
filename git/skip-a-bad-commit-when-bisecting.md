# Skip A Bad Commit When Bisecting

The `git bisect` command helps you quickly track down the commit where a bug
was introduced. It is quick because it picks the optimal (minimal) commits in a
binary search fashion.

It is possible that `git bisect` will pick a commit that you aren't able to
evaluate as _good_ or _bad_. If that commit is in a WIP state or for some other
unrelated reason prevents you from evaluating it, then you are kinda stuck.

To move forward, tell `git bisect` that you want to skip this commit:

```bash
$ git bisect skip
```

It will flag that one as skipped and find you another nearby commit to evaluate
instead.

If your commit history is in such a state that you have to skip many of the
suggested commits, it is possible that `git bisect` will not be able to help
you identify the problem commit. You may be left with a few commits that you'll
have to manually read through and evaluate.

This is a good reason to keep your commits atomic and in a functional state.

[source](https://git-scm.com/docs/git-bisect#_bisect_skip)
