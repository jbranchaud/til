# Track psql History Separately Per Database

By default, `psql` will keep track of all recent queries and commands in the
`.psql_history` file in your home directory.

When in a `psql` session, you can hit the `Up` key to go back through the
history to find a previously entered query. That means you can quickly retrieve
and rerun past queries.

However the default `psql` configuration means that your history can contain
queries from a `psql` session with another database that don't make sense in
the context of the current database.

You can keep these query histories separate by configuring `psql` to use
separate history files per database. This can be done by adding the following
line to your `~/.psqlrc` file.

```
\set HISTFILE ~/.psql_history-:DBNAME
```

[source](https://github.com/hashrocket/dotmatrix/commit/1bd581db3a7192eb7aaa766a97e4b4b82d544067)
