# Dropping Commits With Git Rebase

I've been warned enough times about the potential dangers of `git reset
--hard ...` that I always second guess myself as I type it out. Is it `git
reset --hard HEAD` or `git reset --hard HEAD~`?

If the working directory and index are clean, then there is another way to
remove commits. A way that gives me more confidence about what exactly is
being removed.

Doing an interactive rebase gives you a number of options. One of those
options is `d` (which stands for `drop`).

```
$ git rebase -i master
```

This pulls up an interactive rebase with all commits going back to what is
on master -- great for when working from a feature branch.

```
pick 71ed173 Add Create A Stream From An Array as a reasonml til
pick 80ac8d3 Add some clarity by distinguishing var names
d 4f06c32 Add Data Structures With Self-Referential Types as a reasonml til
d 01a0e75 Fix the name of this file
```

Adding `d` next to the commits you want to get rid of and saving will drop
those commits. The great part is that there is zero ambiguity about which
ones are being dropped.

h/t Jake Worth
