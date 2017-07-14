# Rebase Commits With An Arbitrary Command

Interactive rebasing is a powerful way to manage and tend to the history of
a git repository. Rewording and squashing commits are fairly common actions.
But what if you need to run some arbitrary command against a series of
recent commits?

This is where the `--exec` flag comes in to play.

```bash
$ git rebase -i HEAD~3 --exec "git commit --amend --reset-authors -CHEAD"
```

This generates an interactive rebase file that you can review and save when
ready.

```
pick ea4a215 Add Globally Install A Package With Yarn as a javascript til
exec git commit --amend --reset-author -CHEAD
pick a4f4143 Add Initialize A New JavaScript Project With Yarn as a javascript til
exec git commit --amend --reset-author -CHEAD
pick 2f00aeb Add Default And Named Exports From The Same Module as a javascript til
exec git commit --amend --reset-author -CHEAD
```

As you can see, the specified command is prepared for execution for each
commit involved in the rebase.

h/t [Patricia Arbona](https://github.com/arbonap)
