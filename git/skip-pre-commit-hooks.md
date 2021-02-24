# Skip Pre-Commit Hooks

Projects can choose to adopt pre-commit hooks as part of their contribution
workflow. These hooks can help enforce project standards like ensuring a set of
changes are formatted and linting properly. These can be set up with a tool
like [husky](https://github.com/typicode/husky) or with a custom script.

As you're working on a feature branch, you can and should make frequent
checkpoint commits like a climber puts
[pitons](https://en.wikipedia.org/wiki/Piton) into the rock face. These are
anchor points that reduce the risk of losing work. They make it easier and
safer to return to a point in time when your code was in a "good" state.

If your checkpoint commit isn't conforming to all the pre-commit hook checks,
you can choose to skip the checks and commit anyway. To do this, tack on the
`--no-verify` flag.

```bash
$ git commit --no-verify
```

With this checkpoint in place, you can either plunge forward with the feature
or you can even go fix the pre-commit violations and combine them into
(`--amend`) that checkpoint commit.

Don't abuse this. You still want the overall work to conform to project
guidelines. Use the process that works best for you as you get there.

See `man git-commit` for more details.
