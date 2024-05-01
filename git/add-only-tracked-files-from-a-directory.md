# Add Only Tracked Files From A Directory

The two extremes of staging files in a git repo are to either selectively pick
each individual chunk of changes with `git add --patch` (my preference!) or to
run `git add -A` to add everything.

Now let's say I have large directory full of files that get generated during
test runs. Most of these files are tracked (already checked in to the
repository). There are also many new files generated as part of the most recent
test run.

I want to staging the changes to files that are already tracked, but hold off
on doing anything with the new files.

Running `git add spec/cassettes` won't do the track because that will pull in
everything. Running `git add --patch spec/cassettes` will take long and be
tedious. Instead what I want is the `-u` flag. It's short for _update_ which
means it will only stage already tracked files.

```bash
$ git add -u spec/cassettes
```

That will stage every change to any already known files in `spec/cassettes`.

See `man git-add` for more details.
