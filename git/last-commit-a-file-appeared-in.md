# Last Commit A File Appeared In

In my project, I have a `README.md` file that I haven't modified in a while.
I'd like to take a look at the last commit that modified it. The `git log`
command can be used here with few arguments to narrow it down.

```
$ git log -1 -- README.md
commit 6da76838549a43aa578604f8d0eee7f6dbf44168
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sun May 17 12:08:02 2015 -0500

    Add some documentation on configuring basic auth.
```

This same command will even work for files that have been deleted if you
know the path and name of the file in question. For instance, I used to have
an `ideas.md` file and I'd like to find the commit that removed it.

```
$ git log -1 -- docs/ideas.md
commit 0bb1d80ea8123dd12c305394e61ae27bdb706434
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat May 16 14:53:57 2015 -0500

    Remove the ideas doc, it isn't needed anymore.
```
