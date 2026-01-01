# Look In Ruby Version Dotfile

Newer versions of [`mise`](https://mise.jdx.dev/dev-tools/) specifically only
look for tool versions in `mise.toml` as well as the asdf `.tool-versions` file.
A lot of Ruby projects use the `.ruby-version` file to indicate the Ruby version
of a project. To continue to use the `.ruby-version` file instead of migrating
to `mise.toml`, you need to tell `mise` that you prefer to use the idiomatic
version file.

I added the following line to my
[`~/.config/mise/config.toml`](https://github.com/jbranchaud/dotfiles/commit/8edeb7a9c53500e89e88b4079cbd1859ebebcbda)
file:

```toml
idiomatic_version_file_enable_tools = ["ruby"]
```

Now, whenever `mise` is looking for the specified Ruby version of a project, it
will also look for `.ruby-version`.

Here is a [full list of idomatic version files supported by
`mise`](https://mise.jdx.dev/configuration.html#idiomatic-version-files).

See
[`idiomatic_version_file_enable_tools`](https://mise.jdx.dev/configuration/settings.html#idiomatic_version_file_enable_tools)
for more details.
