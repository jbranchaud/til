# Include Multiple Tables In A pg_dump

When the `pg_dump` command is given the `-t` flag, it will dump just the table
named with that flag. If you want to include multiple tables in the dump, you
just need to use the flag multiple times.

```bash
$ pg_dump -t users -t users_roles -t roles my_database > roles.dump.sql
```

Alternatively, you can specify a
[pattern](https://www.postgresql.org/docs/current/app-psql.html#APP-PSQL-PATTERNS)
when using the `-t` flag.

```bash
$ pg_dump -t 'users*|roles' my_database > roles.dump.sql
```

You have to be a little more mindful of what will and won't be included when
crafting a pattern. It is a nice shortcut for a well-known or well-constrained
data model.

See the [`pg_dump`
docs](https://www.postgresql.org/docs/current/app-pgdump.html) for more
details, as well as [some
examples](https://www.postgresql.org/docs/current/app-pgdump.html#PG-DUMP-EXAMPLES).
