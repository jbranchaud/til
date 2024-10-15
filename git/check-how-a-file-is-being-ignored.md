# Check How A File Is Being Ignored

There are a few places on your machine where you can specify the files that git
should ignore. The most common is a repository's `.gitignore` file. The other
places those excludes are specified can be more obscure. Fortunately, `git
check-ignore` is a command that can show you specifically where.

For instance, let's check why my `notes.md` file is being ignored.

```bash
$ git check-ignore -v .DS_Store
.git/info/exclude:7:notes.md   notes.md
```

At some point I added it to my repo's `.git/info/exclude` file. The `-v` flag
(_verbose_) when included with `check-ignore` tells me the file location.

How about these pesky `.DS_Store` directories? How are those being ignored?

```bash
$ git check-ignore -v .DS_Store
/Users/jbranchaud/.gitignore:3:.DS_Store        .DS_Store
```

Ah yes, I had added it to my _global exclude file_ which I've configured in
`~/.gitconfig` to be the `~/.gitignore` file.

See `man git-check-ignore` for more details.
