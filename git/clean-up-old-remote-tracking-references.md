# Clean Up Old Remote Tracking References

After working on a Git-versioned project for a while, you may find that
there are a bunch of references to remote branches in your local repository.
You know those branches definitely don't exist on the remote server and
you've removed the local branches, but
you still have references to them lying around. You can reconcile this
discrepancy with one command:

```bash
$ git fetch origin --prune
```

This will prune all those non-existent remote tracking references which is
sure to clean up your git log (`git log --graph`).

[source](http://stackoverflow.com/a/3184742/535590)
