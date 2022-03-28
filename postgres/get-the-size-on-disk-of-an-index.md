# Get The Size On Disk Of An Index

Indexes, when added to the right columns, can provide massive performance gains
for certain queries. Indexes aren't free though. It is worth noting that they
take up disk space. The amount of disk space they take is generally irrelevant,
but it is at least worth being aware of. Especially if you're deal with a
massive table.

You can check the current size of an index on disk with [PostgreSQL's
`pg_relation_size`
function](https://www.postgresql.org/docs/current/functions-admin.html).

First, you'll want to look up the name of the index you're curious about.
Running `\d table_name` (replacing `table_name` with the name of the table the
index is on) will show you everything about the table including its indexes and
their names.

Then run the following query:

```sql
select pg_size_pretty(pg_relation_size('index_users_on_email'));
 pg_size_pretty
----------------
 41 MB
(1 row)
```

This one is pretty small. They can get pretty big though. I've seen some that
take up over 1GB on disk.
