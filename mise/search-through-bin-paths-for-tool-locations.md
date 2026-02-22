# Search Through Bin Paths For Tool Locations

The `mise bin-paths` command will list all the bin paths that are managed by
`mise`. When you tell `mise` to install a tool, it installs a specific version
at a location where its binaries can be made accessible on the system path.

While `mise ls` is useful for seeing what is installed by `mise` and at what
version, the `bin-paths` command can tell you where those tool installations
with their binaries are located.

Combine this with `grep` or `rg` to narrow down the results to tools by a
specific name:

```bash
❯ mise bin-paths | rg 'neovim'
/Users/lastword/.local/share/mise/installs/npm-neovim/5.4.0/bin
/Users/lastword/.local/share/mise/installs/pipx-neovim-remote/2.5.1/bin
/Users/lastword/.local/share/mise/installs/neovim/0.11.6/bin
```

I can then look in one of these directories to see the one or more binaries that
they include. For instance, here is what is in the `node` bin path:

```bash
❯ ls /Users/lastword/.local/share/mise/installs/node/22.22.0/bin
 ./   ../   claude@   corepack@   node*   npm*   npx@
```

See `mise bin-paths --help` for more details.
