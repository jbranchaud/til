# Undo Latest Changes Committed To Specific File

I'm reviewing the changes I've made in a PR before I request a review from my
team. There are a scattering of changes in one file that I've changed my mind
on. Everything else looks good though. So, I need to undo the changes in that
file before proceeding.

Manually undoing them is going to be clunky. There is a way to do it with `git
checkout`, but that is one of the ways in which `git-checkout` was overloaded
leading to the release of `git-restore`.

Let's use `git-restore` instead. By specifying a `--source`, I can tell `git`
what _ref_ in the commit history that file should be restored to. I'm on a
short-lived feature branch, so pointing to `main` is good enough.

```bash
$ git restore --source=main app/models/customer.rb
```

If I've changed a file at multiple points on this feature branch and I don't
want to undo all of them, then pointing to `main` is no longer going to work.
Instead, I can point to the commit right before the current one (`HEAD`) that
I'm trying to undo.

```bash
$ git restore --source=HEAD~ app/models/customer.rb
```

This really isn't much different than the `git-checkout` version, but I still
find it to be a little clearer.

```bash
$ git checkout HEAD~ -- app/models/customer.rb
```

See `man git-restore` for more details.
