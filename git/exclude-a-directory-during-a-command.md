# Exclude A Directory During A Command

Many of the git commands we use, such as `git add`, `git restore`, etc., target
files and paths relative to the current directory. This is typically exactly
what we want, to stage and unstage and so forth the files and directories in
front of us.

I recently ran into a situation where I needed to restore a small subset of
changes. At the same time, I had a massive number of auto-generated files
recording HTTP interactions (hundreds of files, modified on the working tree).
I wanted to run a `git restore`, but wading through all those HTTP recording
files was not feasible.

I needed to exclude those files. They all belonged to a `spec/cassettes`
directory. I could exclude them with a _pathspec_ magic signature pattern which
is used to alter and limit the paths in a git command.

A _pathspec_ magic signature is a special pattern made up of a `:` followed by
some signature declaring what the pattern means.

The `(exclude)`, `!`, and `^` magic signatures all mean the same thing —
exclude. So, we can exclude a directory from a `git restore` command like so:

```bash
$ git restore --patch -- . ':!spec/cassettes'
```

We've employed two pathspec patterns here. The first, `.`, scopes everything to
the current directory. The second, `':!spec/cassettes'` excludes everything in
the `spec/cassettes` directory.

See `man gitglossary` for more on _pathspecs_.
