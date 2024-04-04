# Unrestrict Where ripgrep Searches

One of the conveniences of [`rg`
(ripgrep)](https://github.com/BurntSushi/ripgrep) is that by default it doesn't
search in places you probably don't want it to search. That means it ignores
anything specified by your `.gitignore` file, it excludes hidden files and
directories (dotfiles, e.g. `.git/` or `.env`), and it excludes binary files.

These restrictions can be incrementally undone as needed using the `-u` flag.

The `-u` flag on its own will remove the ignored files restriction. This is
equivalent to the `--no-ignore` flag.

```bash
$ rg -u pattern
```

Adding an additional `u` (`-uu`) to that flag will remove both the ignored files and
hidden files restrictions. This is a shorthand equivalent to both `--no-ignore`
and `--hidden`.

```bash
$ rg -uu pattern
```

Adding one more `u` (`-uuu`) will additionally remove the binary file
restriction. Equivalent to those other two flags plus `--text`.

```bash
$ rg -uuu pattern
```

[source](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering)
