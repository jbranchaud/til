# Change Existing Column To Not Null

Let's say you have an existing nullable column. You want to update the schema
to enforce a `not null` constraint on that column. You can do that with an
[`alter table`](https://dev.mysql.com/doc/refman/8.0/en/alter-table.html) DDL
statement. You can do this with the `modify` or `change` option.

With `modify` you redeclare the column definition with the options that you
want. You'll need to know and specify the existing data type of that column.

```sql
alter table books modify publication_year int not null;
```

It is possible, but clumsy to do this with the `change` option because you
declare the column name twice. That's because `change` is typically used to
rename a column.

```sql
alter table books change publication_year publication_year int not null;
```

If you're updating a column for a table that already contains data, make a plan
to backfill any existing records that have `null` for that column. Every record
will need a value in that column before the `modify` can be applied.

[source](https://stackoverflow.com/a/6305252/535590)
