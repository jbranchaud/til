# Reference Commits Earlier Than Reflog Remembers

While preparing some stats for a recent blog post on [A Decade of
TILs](https://www.visualmode.dev/a-decade-of-tils), I ran into an issue
referencing chuncks of time further back than 2020.

```bash
❯ git diff --diff-filter=A --name-only HEAD@{2016-02-06}..HEAD@{2017-02-06} -- "*.md"
warning: log for 'HEAD' only goes back to Sun, 20 Dec 2020 00:26:27 -0600
warning: log for 'HEAD' only goes back to Sun, 20 Dec 2020 00:26:27 -0600
```

This is because `HEAD@...` is a reference to the `reflog`. The `reflog` is a
local-only log of objects and activity in the repository. That date looks
suspiciously like the time that I got this specific machine and cloned the
repo.

In order to access this information, I need a different approach of finding
references that bound these points in time.

How about asking `rev-list` for the first commit it can find before the given
dates in 2017 and 2016 and then using those.

```bash
❯ git rev-list -1 --before="2017-02-07 00:00" HEAD
17db6bc4468616786a8f597a10d252c24183d82e

❯ git rev-list -1 --before="2016-02-07 00:00" HEAD
f1d3d1f796007662ff448d6ba0e3bbf38a2b858d

❯ git diff --diff-filter=A --name-only f1d3d1f796007662ff448d6ba0e3bbf38a2b858d..17db6bc4468616786a8f597a10d252c24183d82e -- "*.md"

# git outputs a bunch of files ...
```
