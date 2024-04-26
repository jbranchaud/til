# Check If Clusters Are Upgrade Compatible

One of the ways to upgrade a PostgreSQL database from one server version to
another is to use the built-in `pg_upgrade` command. This can be faster and
require fewer manual steps than something like a `pg_dump` and `pg_restore`.

However, before you run the `pg_upgrade` command for real, you should check
that the target database is compatible with the current database. To do this,
write your `pg_update` command with all the flags you need and then tack on
`--check` at the end. This does a dry-run reporting the results of a series of
consistency checks.

Here is what a successful _check_ looks like:

```bash
$ /usr/local/opt/postgresql@13/bin/pg_upgrade \
  --old-bindir $HOME/.asdf/installs/postgres/12.3/bin \
  --new-bindir /usr/local/opt/postgresql@13/bin \
  --old-datadir $HOME/.asdf/installs/postgres/12.3/data \
  --new-datadir ./postgres/data \
  --check

Performing Consistency Checks
-----------------------------
Checking cluster versions                                   ok
Checking database user is the install user                  ok
Checking database connection settings                       ok
Checking for prepared transactions                          ok
Checking for system-defined composite types in user tables  ok
Checking for reg* data types in user tables                 ok
Checking for contrib/isn with bigint-passing mismatch       ok
Checking for presence of required libraries                 ok
Checking database user is the install user                  ok
Checking for prepared transactions                          ok
Checking for new cluster tablespace directories             ok

*Clusters are compatible*
```

If there is an issue, such as mismatched collation settings, the output will
report the issue. You'll have to decide how to resolve those on a case-by-case
basis.
