# Cherry Pick Multiple Commits At Once

I've always thought of `git cherry-pick` as being a command that you can run
against a single commit by specifying the SHA of that commit. That's how I've
always used it.

The man page for `git-cherry-pick` plainly states:

> Given one or more existing commits, apply the change each one introduces,
> recording a new commit for each.

We can cherry pick multiple commits at once in a single command. They will be
applied one at a time in the order listed.

Here we can see an example of applying two commits to the current branch and
the accompanying output as they are auto-merged.

```bash
$ git cherry-pick 5206af5 6362f41
Auto-merging test/services/event_test.rb
[jb/my-feature-branch 961f3deb] Use the other testing syntax
 Date: Fri May 2 10:50:14 2025 -0500
 1 file changed, 7 insertions(+), 7 deletions(-)
Auto-merging test/services/event_test.rb
[jb/my-feature-branch b15835d0] Make other changes to the test
 Date: Fri May 2 10:54:48 2025 -0500
 1 file changed, 7 insertions(+), 7 deletions(-)
```

If the commits cannot be cleanly merged, then you may need to do some manual
resolution as they are applied. Or maybe you want to try including the
`-Xpatience` merge strategy.

See `man git-cherry-pick` for more details. Make sure to look at the _Examples_
section which contains much more advanced examples beyond what is shown above.
