# Find System-wide Config File For User

The `jj` CLI can be configured in a couple different places. When I recently
ran a `jj config` command, I was curious where specifically it was getting set.
Those changes didn't appear in the repo's config (`./.jj/repo/config.toml`).
That makes sense since it would only apply to that repo. So, where is the
system-wide config file?

The following commond shows where on your machine it is located.

```bash
$ jj config path --user
/Users/jbranchaud/Library/Application Support/jj/config.toml
```

Now, the next time I set a config like this:

```bash
$ jj config set --user ui.paginate never
```

or want to check what other config options are set to, I can visit that path
and take a look.

[source](https://github.com/martinvonz/jj/blob/main/docs/config.md)
