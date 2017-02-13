# What Changed?

If you want to know what has changed at each commit in your Git history,
then just ask `git whatchanged`.

```bash
$ git whatchanged

commit ddc929c03f5d629af6e725b690f1a4d2804bc2e5
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sun Feb 12 14:04:12 2017 -0600

    Add the source to the latest til

:100644 100644 f6e7638... 2b192e1... M  elixir/compute-md5-digest-of-a-string.md

commit 65ecb9f01876bb1a7c2530c0df888f45f5a11cbb
Author: jbranchaud <jbranchaud@gmail.com>
Date:   Sat Feb 11 18:34:25 2017 -0600

    Add Compute md5 Digest Of A String as an Elixir til

:100644 100644 5af3ca2... 7e4794f... M  README.md
:000000 100644 0000000... f6e7638... A  elixir/compute-md5-digest-of-a-string.md

...
```

This is an old command that is mostly equivalent to `git-log`. In fact, the
man page for `git-whatchanged` says:

> New users are encouraged to use git-log(1) instead.

The difference is that `git-whatchanged` shows you the changed files in
their raw format which can be useful if you know what you are looking for.

See `man git-whatchanged` for more details.
