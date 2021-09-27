# Clean Out Working Copy With Patched Restore

I sometimes let the working copy of my projects get a little messy. The working
copy is all the changes I've made to tracked files that haven't been staged or
commited.

After working for a bit, especially on something more exploratory, I end up
with comments, log statements, and debugging calls scattered across a bunch of
files.

If these exploratory changes are mixed in with a bunch of actual changes, it
can create a lot noise. I can clean up that noise by restoring the files. I can
be surgical about it with the `--patch` flag.

```bash
$ git restore --patch
```

This will prompt me for each changeset.

- `y` -- yes, restore that change
- `n` -- no, leave it there
- `q` -- bail out of the restore

There are other _patch_ options, but these are the ones I use the most. To see
what the rest of the options are, go to `man git-add` and find `patch` in the
`INTERACTIVE MODE` section.
