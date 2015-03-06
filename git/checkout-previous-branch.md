# Checkout Previous Branch

Git makes it easy to checkout the last branch you were on.

```bash
$ git checkout -
```

This is shorthand for `git checkout @{-1}` which is a way of referring to
the previous (or last) branch you were on. You can use this trick to easily
bounce back and forth between `master` and a feature branch.

[source](http://stackoverflow.com/questions/7206801/is-there-any-way-to-git-checkout-previous-branch)
