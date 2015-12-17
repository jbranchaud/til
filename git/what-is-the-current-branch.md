# What Is The Current Branch?

This question can be answered with one of git's plumbing commands,
`rev-parse`.

```
$ git rev-parse --abbrev-ref HEAD
```

The `--abbrev-ref` flag tells `git-rev-parse` to give us the short name for
`HEAD` instead of the SHA.

[source](http://stackoverflow.com/a/12142066/535590)
