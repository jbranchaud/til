# Auto-Squash Those Fixup Commits

As a fan of [atomic commits](https://dev.to/jbranchaud/atomic-commits-4hk2), I
sometimes find myself with some changes that are ready to stage that belong on
an earlier commit. If it is the immediately previous, I'll do an `--amend`. For
anything further back than that, I've come to love the use of `git commit
--fixup <SHA>`.

Once one or more _fixup_ commits are on the current branch, they'll need to be
_squashed_ into the commits for which they've been targeted. This calls for a
`git rebase`.

Git knows how to squash fixup commits into the correct place, but you have to
tell it to do so automatically. You can do that one of two ways.

You can either include the `--autosquash` flag each time you rebase:

```bash
$ git rebase -i --autosquash
```

Or you can tell Git to always autosquash in your `~/.gitconfig`:

```
[rebase]
	autoSquash = true
```

See the section on `--autosquash` in `man git-rebase` for more details.
