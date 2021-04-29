# Install Postgres With uuid-ossp Using asdf

The `uuid-ossp` extension is part of `postgres-contrib` and is often included
with installs of PostgreSQL. By default, when installing PostgreSQL with
[`asdf`](https://asdf-vm.com/#/) using the
[`asdf-postgres`](https://github.com/smashedtoatoms/asdf-postgres) plugin, the
`uuid-ossp` extension is not included.

Without it I had trouble running schema migrations against a database that was
trying to create the `uuid-ossp` extension:

> postgresql uuid-ossp.control file missing in extention folder

To include `uuid-ossp` when installing Postgres with `asdf`, you'll need to
include _extra config options_.

For instance, to install Postgres 9.6.21 with `uuid-ossp` included:

```bash
$ POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs" asdf install postgres 9.6.21
```

There are some resources that recommend using `--with-uuid=ossp`, but that
appears to require a prerequisite install of a separate package, so I prefer
the `e2fs` option.

[source](https://github.com/smashedtoatoms/asdf-postgres/issues/4#issuecomment-350592132)
