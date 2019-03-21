# List Commits On A Branch

You can list all commits that have taken place since a branch split off from
another branch using `git log`. You just need to specify a ref range with
the originating branch and the branch of interest.

```bash
$ git log master..my-feature-branch
```

That will list all commits on `my-feature-branch` since it branched off from
`master`.

I like to tighten up the output a bit with a flag:

```bash
$ git log master..my-feature-branch --oneline
```

See `man git-log` for more details.
