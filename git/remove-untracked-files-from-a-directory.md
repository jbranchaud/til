# Remove Untracked Files From A Directory

Let's say I have a directory (`spec/cassettes`) full of a ton of generated YAML
files. Most of these files are tracked by git. However, I just generated a
bunch of new ones that are untracked. For whatever reason, I don't want these
files. I need to delete them.

Running `rm` on each of them is going to be too tedious. And it is tricky to
target them for a bulk delete since there are a ton of other files in that
directory that I want to keep.

One way to approach this is have `git ls-files` help out with listing all files in the
directory that are untracked. The `--others` flag filters to untracked files.

```bash
git ls-files --others --exclude-standard spec/cassettes
```

From there, I can pipe it to `rm` (with `xargs` collapsing all the files into a
single line):

```bash
git ls-files --others --exclude-standard spec/cassettes | xargs rm
```

See `man git-ls-files` for more details.
