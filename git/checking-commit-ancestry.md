# Checking Commit Ancestry

I have two commit shas and I want to know if the first is an ancestor of the
second. Put another way, is this first commit somewhere in the history of
this other commit.

Git's `merge-base` command combined with the `--is-ancestor` flag makes
answering this question easy. Furthermore, because it is a plumbing command,
it can be used in a script or sequence of commands as a switch based on the
answer.

Here is an example of this command in action:

```bash
$ git merge-base --is-ancestor head~ head && echo 'yes, it is'
yes, it is
$ git merge-base --is-ancestor head~ head~~ && echo 'yes, it is'
```

In the first command, `head~` is clearly an ancestor of `head`, so the
`echo` command is triggered. In the second, `head~` is not an ancestor of
`head~~` so the return status of 1 short-circuits the rest of the command.
Hence, no `echo`.

See `man git-merge-base` for more details.

[source](http://stackoverflow.com/questions/18345157/how-can-i-tell-if-one-commit-is-an-ancestor-of-another-commit-or-vice-versa)
