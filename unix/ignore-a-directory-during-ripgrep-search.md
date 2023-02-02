# Ignore A Directory During ripgrep Search

When searching for patterns in project with many directories and files using
`ripgrep`, it is easy to end up with an overwhelming amount of results. If you
know that a certain directory of results isn't of interest, you can exclude
that directory. This is done with the glob flag (`-g`) and the inverse (`!`)
operator.

Here is an example of just using the `-g` flag. This will find all matches of
the pattern within that directory.

```bash
$ rg 'some pattern' -g 'dir/'
```

To instead exclude that directory and by extension search everywhere else, we
can invert the glob match with `!`.

```bash
$ rg 'some pattern' -g '!dir/'
```

This says, find the pattern anywhere that is not in `dir/`.

[source](https://blog.wxm.be/2020/11/08/ignore-folder-in-ripgrep.html)
