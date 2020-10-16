# Exclude A File From A Diff Output

When running `git diff <SHA>`, you'll see output for all files changed at that
commit. It's the same if you do a range of commits (e.g. `git diff
<SHA1>...<SHA2>`).

If you are looking for changes in a particular part of the tree, then other
changes will be a distraction. Some generated files, such as `yarn.lock`, can
create a lot of noise in the diff output.

You can get a more focused output by excluding certain files and paths. The
syntax for doing that, however, is a bit wonky.

To exclude a file, you have to add an argument formatted like
`':(exclude)<filename>`.

For instance, to exclude `yarn.lock`:

```bash
$ git diff <SHA> -- . ':(exclude)yarn.lock'
```

or to exclude an entire directory:

```bash
$ git diff <SHA> -- . ':(exclude)spec/**'
```

[source](https://stackoverflow.com/questions/39931781/git-diff-stat-exclude-certain-files/39937070#39937070)
