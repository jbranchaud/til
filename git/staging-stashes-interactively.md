# Staging Stashes Interactively

The `-p` flag can be used with `git stash`, just as it is used with `git add`,
for interactively staging a stash.

So, if you have changes in your working tree that you want to stash mixed
with ones that you want to keep working with, then you can simply do:

```
git stash -p
```

Read more on [interactive
staging](https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging).
