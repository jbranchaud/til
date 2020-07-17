# Include A Message With Your Stashed Changes

If you were to quickly stash some changes, you end up with a stash reference
that git would attach a little context to, such as the latest commit SHA and
the first line of its commit message.

```bash
$ git stash list
stash@{0}: WIP on master: 6766419 Add link to source for latest TIL
```

Often this won't provide you the needed context to return to your stash and
pick up where you left off even days later.

You can customize the message of a stash with the `-m` flag.

```bash
$ git stash push -m 'made some changes'
```

When you view your stash list, you'll see your custom message.

```bash
$ git stash list
stash@{0}: On master: made some changes
```

And hopefully that's the context you need to hit the ground running.

See `man git-stash` for more details.
