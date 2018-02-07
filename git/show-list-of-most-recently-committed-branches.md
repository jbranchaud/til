# Show List Of Most Recently Committed Branches

The standard way to list your branches is with the `git branch` command. If
you use branches extensively for feature work and bug fixes, you may find
yourself overwhelmed by the list of branches trying to visually parse
through them for the one that you had worked on recently.

With the `git for-each-ref` command, we can produce a better list of
branches.

```bash
$ git for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/
```

The command itself will iterate over all of the repository's refs and print
them out as a list. The `--sort=-committerdate` option will ensure that list
is sorted by refs mostly recently committed to. The `--count=10` option
limits the list output to 10 refs. The `format` flag cleans up the output a
bit, only showing the shortname of the ref. Lastly, the `refs/heads/`
argument ensures that only local refs are included in the output, thus
ignoring remote refs.

The result is a list of local branches ordered by recency which generally
corresponds to relevance.

See `man git-for-each-ref` for more details.

[source](https://twitter.com/djm_/status/961289486721339392)
