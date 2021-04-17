# Set The asdf Package Version For A Single Shell

Generally when using [`asdf`](https://asdf-vm.com/), I set the global version
for a package/language to a good up-to-date default. And then I set `local`
versions for specific projects which get written to the `.tool-versions` file.

There is another option that `asdf` supports for when you want to use a version
without it being so _sticky_.

```bash
$ asdf shell postgres 12.3

$ psql --version
psql (PostgreSQL) 12.3

$ postgres --version
postgres (PostgreSQL) 12.3
```

With the
[`shell`](https://asdf-vm.com/#/core-manage-versions?id=set-current-version)
command, I tell `asdf` to shim the specified package version just for this
shell instance. If I switch back to another tab or open a new one, neither of
them will have been impacted by this shell-constrained setting.

This is handy for a one-off situation where you want to try something at a
specific version without impact the rest of your terminal session.
