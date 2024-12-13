# Fix Whitespace Errors Throughout Branch Commits

Let's say we've been working on some changes to our repository on a branch.
We've made several commits. We are close to putting up a PR, but we want to
make sure everything is tidied up.

We run a check and see that there are some whitespace errors that should be
fixed.

```bash
$ git diff main --check
README.md:1: trailing whitespace.
+# git-playground
script.sh:9: trailing whitespace.
+
```

This post isn't able to show the highlighted whitespace errors, but we can see
the warnings above.

Rather than cluttering things with an additional commit that fixes these errors
or manually cleaning up each commit, we can ask `git` to fix it for us.

```bash
$ git rebase --whitespace=fix main
```

That will do a manual rebase of each commit addressing the whitespace errors.

We can run the error check again and see no output, which means we are good to
go.

```bash
$ git diff main --check
```

See the section on `--whitespace` in `man git-apply` for more details.

[source](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
