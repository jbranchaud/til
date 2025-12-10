# Describe Current Changes And Create New Change

One of the first patterns I learned with `jj` was a pair of commands to
essentially "commit" the working copy and start a fresh, new change. So if I am
done making some changes, I can add a description to the `(no description)`
working copy and then start a new working copy _change_.

```bash
$ jj describe -m "Add status subcommand to show current status"
$ jj new
```

I learned from [Steve](https://steveklabnik.com/) in the [jj
discord](https://discord.gg/dkmfj3aGQN) that a shorthand for this pattern is to
use the `jj commit` command directly.

> When called without path arguments or `--interactive`, `jj commit` is
> equivalent to `jj describe` followed by `jj new`.

That means, instead of the above pair of commands, I could have done:

```bash
$ jj commit -m "Add status subcommand to show current status"
```

That would have had the same result in my case. However, notice the caveats
mentioned in the quote above and check out `man jj-commit` for more details on
that.
