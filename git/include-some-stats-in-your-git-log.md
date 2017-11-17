# Include Some Stats In Your Git Log

A simple `git log` command is going to give you a concise set of information
for each commit. Usually it is enough info. When it's not, `git log` can
provide additional information with the right flags. To include overall and
per-file stats on the number of insertions and deletions, use the `--stat`
flag.

```bash
$ git log --stat
commit 66e67741a1cd6857a4467d1453c9f17ef5849f20
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Mon Nov 13 21:24:41 2017 -0600

    Add Focus The URL Bar as an internet til

 README.md                     |  3 ++-
 internet/focus-the-url-bar.md | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

commit 9241e3919ef1e4f68b71a1491d368ae6361084aa
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat Nov 11 11:41:40 2017 -0600

    Add Freeze An Object, Sorta as a javascript til

 README.md                            |  3 ++-
 javascript/freeze-an-object-sorta.md | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

...
```

See `man git-log` for more details.
