# Using Commands With A Relative Date Format

If you want to know what changed on a branch _since_ last week, you can more or
less ask just like that:

```bash
$ git log --since="1 week ago"
```

Or, what has happened since yesterday:

```bash
$ git log --after="yesterday"
```

The `--since`/`--after` flags, and their counterparts `--until`/`--before`,
accept a variety of date formats including _relative dates_.

Relative dates can be used with other commands and even as a ref modifier. For
instance, this is a way of comparing `develop` from a week ago with `develop`
from two weeks ago:

```bash
$ git diff develop@{"1 week ago"} develop@{"2 weeks ago"}
```

[source](https://alexpeattie.com/blog/working-with-dates-in-git)
