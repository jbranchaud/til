# Check The Installed OpenSSL Version

Typically with command line tools, I can use a `--version` or `-v` flag with
the command to get it to output the current version. This is not the case with
`openssl`.

When I do this:

```bash
$ openssl --version
```

I get an Invalid Command message and then a bunch of subcommands are displayed.

One of those subcommands listed under _Standard Commands_ is the `version`
command. This is what I can use to list the version.

```bash
$ openssl version -v
LibreSSL 2.8.3
```

See `man openssl` for more details.
