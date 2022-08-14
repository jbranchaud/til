# Shorthand To Force Push A Branch

If your local version of a branch differs in its history from the matching
remote branch, then git will prevent you from pushing. You can override the
difference on the remote by force pushing. One way of doing that is with the
`--force` flag.

```bash
$ git push --force origin main
```

There is a shorthand for this. [Prefix the branch name with a
`+`](https://git-scm.com/docs/git-push#Documentation/git-push.txt---force).

```bash
$ git push origin +main
```

When working in a team context, it is typically a safer bet to use
`--force-with-lease` instead of force. That way if the remote contains new
changes that you haven't pulled down yet, you will prevent yourself from
accidentally overriding them.

If you feel you must use `--force`, double check what will happen. Avoid
accidentally clobbering work that could be hard or impossible to recover.

[source](https://twitter.com/jbrancha/status/1558861987374780416?s=20&t=D7T_aTBaF97AwOvUnz9Muw)
