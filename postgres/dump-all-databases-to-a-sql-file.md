# Dump All Databases To A SQL File

I recently needed to reinstall my local Postgres installation. I had several
databases with data in that cluster that I wanted to preserve. Before I could
go uninstalling and re-installing Postgres, I needed to dump the entire cluster
of databases.

The `pg_dumpall` command that installs with Postgres can be used for this.

```bash
$ pg_dumpall > postgres_13_1_cluster_dump.sql
```

The command outputs to stdout a SQL dump of all the databases stored in the
data directory of this Postgres instance.

I took this a step further and ignored the `template0` and `template1`
directories because I knew those would come with the new install. I did that by
adding the `--exclude-database` flag with a pattern.

```bash
$ pg_dumpall \
  --exclude-database="template*" \
  > postgres_13_1_cluster_dump.sql
```

This data dump can be restored with the new install using:

```bash
$ psql -f postgres_13_1_cluster_dump.sql postgres
```

I wrote more about this process in [Reinstall Postgres with OpenSSL Using
asdf](https://dev.to/jbranchaud/reinstall-postgresql-with-openssl-using-asdf-cmj).

Also, see `pg_dumpall --help` or the [Postgres
docs](https://www.postgresql.org/docs/current/app-pg-dumpall.html) for more
details.
