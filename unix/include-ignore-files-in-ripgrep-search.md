# Include Ignore Files In Ripgrep Search

By default, [ripgrep (`rg`)](https://github.com/BurntSushi/ripgrep) will look
for and respect _ignore_ files like `.gitignore`. Any file and directory marked
by those ignore files will no be included in an `rg` search.

This is usually what you want. Sometimes, however, it can be useful to get
results from this ignored files as well.

In order to ignore your ignore files, pass the `--no-ignore` flag to `rg`:

```bash
$ rg --no-ignore ENV_VAR_KEY
```

Something to keep in mind is that `rg` also ignores _hidden_ files and
directories (those things that are prefixed with a `.`, such as `.env` or
`.config/`). If some of your ignored files are also _hidden_ files, then they
still won't show up in search. You'll need the `--hidden` flag as well.

```bash
$ rg --no-ignore --hidden ENV_VAR_KEY
```

A shorthand equivalent for that is `-uu`:

```bash
$ rg -uu ENV_VAR_KEY
```

See `man rg` for more details.
