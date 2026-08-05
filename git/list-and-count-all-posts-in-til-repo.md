# List And Count All Posts In TIL Repo

I want to be able to reliably list and count all posts in [my TIL
repo](https://github.com/jbranchaud/til). I do this to check that the count in
the README is accurate and in [the workflow
script](https://github.com/jbranchaud/jbranchaud/blob/71cba39dffb2bff68bf16d8895e435065e400250/scripts/update_tils.py#L101)
that powers [my GitHub Profile
README](https://github.com/jbranchaud/jbranchaud). In the past, I've used
pattern matching on the listing of all TILs in the
[README.md](https://github.com/jbranchaud/til/blob/master/README.md). That is
error prone and has required me to use two different markdown list styles.

A better approach is to ask `git` how many posts it currently has under version
control. I use a consistent directory structure where each TIL post is a
markdown file that is nested within a single category directory.

```bash
❯ git ls-files -- */*.md
ack/ack-bar.md
ack/case-insensitive-search.md
ack/list-available-file-types.md
...
```

Using `git ls-files` has the added benefit of only listing files that are
currently checked in to the project. So if I run this locally, it won't pick up
a draft post that hasn't been committed yet.

I can then pipe this to `wc -l` (count of all lines) to produce the count:

```bash
❯ git ls-files -- */*.md | wc -l | xargs
1850
```

Note: the empty `xargs` is a trick to trim the whitespace padding that `wc`
introduces.

See `man git-ls-files` for more details.
