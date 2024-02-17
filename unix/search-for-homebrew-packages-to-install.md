# Search For Homebrew Packages To Install

Let's say we want to install the latest version of PostgreSQL with `brew`, but
we aren't sure either what formulas are available nor what the exact name would
be.

We can run a search with the `brew search` subcommand to get an idea of what is
available.

If I run this for even the shorthand of `postgres`, I get a useful set of
results showing me what versions I already have installed and what else is
available.

```bash
$ brew search postgres
==> Formulae
check_postgres    postgresql@11 ✔   postgresql@13     postgresql@15     postgrest         postgis
postgresql@10     postgresql@12     postgresql@14     postgresql@16     qt-postgresql

==> Casks
navicat-for-postgresql               postgres-unofficial                  sqlpro-for-postgres
postbird                             postgrespreferencepane

If you meant "postgres" specifically:
postgresql breaks existing databases on upgrade without human intervention.

See a more specific version to install with:
  brew formulae | grep postgresql@
```

I can then go on to run `brew install postgresql@16` to get the latest.

See `brew search --help` for more details.
