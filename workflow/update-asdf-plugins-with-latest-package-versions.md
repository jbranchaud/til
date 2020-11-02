# Update asdf Plugins With Latest Package Versions

If you've been using [`asdf`](https://github.com/asdf-vm/asdf) for a while,
then the various plugins you are using may be a bit out of date. That means
that they won't have information about the latest versions of their respective
technologies.

You can update all of them at once with the `--all` flag:

```bash
$ asdf plugin update --all
```

This will grab all the latest package version information for each `asdf`
plugin you have installed.

See `asdf help` for more details.
