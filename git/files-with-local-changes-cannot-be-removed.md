# Files With Local Changes Cannot Be Removed

This is a nice quality-of-life feature in `git` that should help you avoid
accidentally discarding changes that won't be retrievable.

```bash
❯ git rm .tool-versions
error: the following file has local modifications:
    .tool-versions
(use --cached to keep the file, or -f to force removal)
```

My `.tool-versions` file has some local changes. I don't realize that and I go
to issue a `git rm` command on that file. Instead of quietly wiping out my
changes, `git` lets me know I'm doing something destructive (these local
changes won't be in the diff or the reflog).

I can force the removal if I know what I'm doing with the `-f` flag. Or I can
take the two step approach of calling `git restore` on that file and then `git
rm`.

The `--cached` flag is also interesting because it doesn't actually delete the
file from my file system, but it does stage the file deletion with `git`. That
means the file now shows up as one of my untracked files.

See `man git-rm` for more details.
