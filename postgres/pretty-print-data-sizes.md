# Pretty Print Data Sizes

Use the `pg_size_pretty()` function to pretty print the sizes of data in
PostgreSQL. Given a `bigint`, it will determine the most human-readable
format with which to print the value:

```sql
> select pg_size_pretty(1234::bigint);
 pg_size_pretty
----------------
 1234 bytes

> select pg_size_pretty(123456::bigint);
 pg_size_pretty
----------------
 121 kB

> select pg_size_pretty(1234567899::bigint);
 pg_size_pretty
----------------
 1177 MB

> select pg_size_pretty(12345678999::bigint);
 pg_size_pretty
----------------
 11 GB
```

This function is particularly useful when used with the
[`pg_database_size()`](get-the-size-of-a-database.md) and
[`pg_relation_size()`](get-the-size-of-a-table.md) functions.

```sql
> select pg_size_pretty(pg_database_size('hr_hotels'));
 pg_size_pretty
----------------
 12 MB
```
