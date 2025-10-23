# Clean Up Your Brew Installations

Over time as you upgrade brew-installed programs and make changes to your
`Brewfile`, your machine will have artifacts left behind that you no longer
need.

Periodically, it is good to clean things up.

First, you can get a summary of stale and outdated files that brew has
installed. Use the `--dry-run` flag.

```bash
$ brew cleanup --dry-run
```

If you feel good about what you see in the output, then give things a clean.

```bash
$ brew cleanup
```

Second, if you are using a `Brewfile` to manage what `brew` installs, then you
can instruct `brew` to uninstall any dependencies that aren't specified in that
file.

By default it operates as a dry run and the `--force` flag will be needed to
actually do the cleanup. And specify the filename if it doesn't match the
default of `Brewfile`.

```bash
$ brew bundle cleanup --file=Brewfile.personal
```

If the output looks good, then force the cleanup:

```bash
$ brew bundle cleanup --force --file=Brewfile.personal
```

See `brew cleanup --help` and `brew bundle --help` for more details.
