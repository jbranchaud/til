# Duplicate A Local Database

You can quickly create a new database instance that is a duplicate of another
database. If the existing database is local, you don't need to dump and
restore. Instead you can use the `createdb` command that comes with Postgres:

```bash
$ createdb -O ownername -T originaldb newdb
```

This creates a new database called `newdb` using `originaldb` as a template
(`-T`). This will include the entire schema and data of the original database.
The `-O` flag allows you to specify the owner of the database. Since this is
local, you probably want your primary unix user as the owner.

[source](https://stackoverflow.com/a/6739995/535590)
