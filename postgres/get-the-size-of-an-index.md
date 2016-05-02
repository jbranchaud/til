# Get The Size Of An Index

Want to get an idea of how much disk space that additional index is taking
up? You can query for it with the same methods discussed in [Get The Size Of
A Table](get-the-size-of-a-table.md) and [Pretty Print Data
Sizes](pretty-print-data-sizes.md).

For instance, if I have a table with a `users_pkey` index and a
`users_unique_lower_email_idx` index, I can check the sizes like so:

```sql
> select pg_size_pretty(pg_relation_size('users_pkey'));
 pg_size_pretty
----------------
 240 kB

> select pg_size_pretty(pg_relation_size('users_unique_lower_email_idx'));
 pg_size_pretty
----------------
 704 kB
```

[source](https://www.niwi.nz/2013/02/17/postgresql-database-table-indexes-size/)
