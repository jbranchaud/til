# Exclude Certain Files From An rsync Run

The `rsync` command can be used to copy files from one directory to another (as
well as to or from a remote system). It is generally used to broadly
synchronize all files in the source directory to a destination directory.

I recently ran into a situation where I wanted to recursively (`-a`) sync files
from a cloned git repository. I didn't want quite everything—namely dotfiles,
dot-directories (such as `.git/`), and top-level markdown files.

This is where the `--exclude` flag comes in to play.

The dotfiles and dot-directories can be excluded with the `.*` pattern.

```bash
$ rsync -anv --exclude='.*' dir1/ dir2
```

The top-level markdown files can be excluded, without excluding nested markdown
files, with the `./*.md` pattern.

```bash
$ rsync -anv --exclude='.*' --exclude='./.*md' dir1/ dir2
```

The `-n` and `-v` flags together provide a dry run of this with results that I
can check. Once I'm ready to do the real thing, I can remove those.

```bash
$ rsync -a --exclude='.*' --exclude='./.*md' dir1/ dir2
```

See `man rsync` for more details.
