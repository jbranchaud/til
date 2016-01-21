# Grep For Files Without A Match

The `grep` command is generally used to find files whose contents match a
pattern. With the `-L` (`--files-without-match`) flag, `grep` can be used to
find files that don't match the given pattern.

For instance, to find files in the current directory that don't have
`foobar` anywhere in their content, run:

```bash
$ grep -L "foobar" ./*
```

[source](http://stackoverflow.com/questions/1748129/using-grep-to-find-files-that-dont-contain-a-given-string-pattern)
