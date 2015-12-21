# Reference A Commit Via Commit Message Pattern Matching

Generally when referencing a commit, you'll use the SHA or a portion of the
SHA. For example with `git-show`:

```
$ git show cd6a63d014
...
```

There are many ways to reference commits though. One way is via regex
pattern matching on the commit message. For instance, if you recently had a
commit with a typo and you had included *typo* in the commit message, then
you could reference that commit like so:

```
$ git show :/typo
Author: Josh Branchaud
Date: Mon Dec 21 15:50:20 2015 -0600

    Fix a typo in the documentation
...
```

By using `:/` followed by some text, git will attempt to find the most
recent commit whose commit message matches the text. As I alluded to, regex
can be used in the text.

See `$ man gitrevisions` for more details and other ways to reference
commits.

[Source](https://twitter.com/jamesfublo/status/678906346335428608)
