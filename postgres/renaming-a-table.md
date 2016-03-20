# Renaming A Table

Using the `alter table` command in PostgreSQL, you can rename an existing
table. This command will also update any references to the table such as via
foreign key constraints. Just run a command like the following:

```sql
alter table ingredient_types rename to item_types;
```

Note that this may result in breaking a number of conventions. Foreign keys,
sequences, and constraints with names eponymous to the original table will
no longer follow convention despite the references being updated. These can
be renamed as well if desired.

See
[`renaming_table.sql`](https://github.com/jbranchaud/postgresing/blob/master/renaming/rename_table.sql)
for a full example.

See the [`alter table`
docs](http://www.postgresql.org/docs/current/static/sql-altertable.html) for
more details.
