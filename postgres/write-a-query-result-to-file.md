# Write A Query Result To File

Generally when writing a query in `psql` a statement will be terminated with
a semicolon. An alternative approach is to end it with a `\g` instead. This
will also send the query to the Postgres server for execution.

```sql
select 1 \g
```

If a filename is included after the `\g`, then the result of the query will
be written to that file instead of output to the `psql` session.

```sql
> select 1, 2, 3 \g query_result.txt
```

If we `cat` that file, we can see the query result.

```sql
Time: 4.293 ms
> \! cat query_result.txt
 ?column? | ?column? | ?column?
----------+----------+----------
        1 |        2 |        3
(1 row)
```

See `man psql` for more details.
