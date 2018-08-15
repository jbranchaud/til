# Grep For Files With Multiple Matches

The `grep` utility is a great way to find files that contain a certain
pattern:

```bash
$ grep -r ".class-name" src/css/
```

This will recursively look through all the files in your css directory to
find matches of `.class-name`.

Often times these kinds of searches can turn up too many results and you'll
want to pare it back by providing some additional context.

For instance, we may only want results where `@media only screen` also
appears, but on a different line. To do this, we need to chain a series of
`greps` together.

```bash
$ grep -rl "@media only screen" src/css |
    xargs grep -l ".class-name"
```

This will produce a list of filenames (hence the `-l` flag) that contain
both a line with `@media only screen` and a line with `.class-name`.

If you need to, chain more `grep` commands on to narrow things down even
farther.

See `man grep` for more details.
