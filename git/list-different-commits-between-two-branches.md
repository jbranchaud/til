# List Different Commits Between Two Branches

There are times when I want to get a sense of the difference between two
branches. I don't want to look at the actual diff though, I just want to see
what commits are on one and the other.

I can do just this by using the `git-log` command with a couple flags, most
importantly the `--cherry-pick` flag.

To compare the `feature` branch against the `master` branch, I can run a
command like the following:

```bash
$ git log --left-right --graph --cherry-pick --oneline feature...branch
```

This lists commits with the first line of their messages. It also includes
either a `<` or `>` arrow at the front of each commit indicating whether the
commit is on the left (`feature`) or right (`master`) branch, respectively.

Note: you can use more than branches in a command like this. Any two
references will work. You can just use two SHAs for instance.

[source](http://stackoverflow.com/questions/7566416/different-commits-between-two-branches)
