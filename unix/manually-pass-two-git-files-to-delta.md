# Manually Pass Two Git Files To Delta

I recently [wired up `delta` as my default pager and differ for
`git`](git/better-diffs-with-delta.md). However, when I installed `delta`, I
first wanted to see what its diff output looked like.

How can I pass two versions of the same file from `git` to `delta`?

I can show the current contents of a file with `git show` referencing the
`HEAD` commit.

```bash
$ git show HEAD:main.go
```

Similiarly, I can show the contents of that file _one_ commit ago with `HEAD~`.

```bash
$ git show HEAD~:main.go
```

I can then pass each of those commands as virtual files to `delta` using the
`<()` syntax. The older file goes first and the newer second.

```bash
$ delta <(git show HEAD~:main.go) <(git show HEAD:main.go)
```

That works and comes in handy if you need to compare two things that aren't
necessarily files or aren't necessarily under version control. However, in
hindsight, I'd say it is easier to add delta as the pager and differ and try it
out directly.
