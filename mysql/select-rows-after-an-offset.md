# Select Rows After An Offset

When doing pagination and other queries for special-case scenarios, we may need
to grab rows after a certain offset.

There are two variations of the MySQL syntax for selecting rows after a certain
offset.

```sql
select * from events limit 100, 10;
```

This first query will grab up to 10 rows after applying an offset of 100.
Typically we'll see a `limit` clause with just one value which represents how
many rows to limit the result set to. However, if we optionally include `N, `
in the middle of that clause. Whatever number `N` is will be the offset.

Another way to write this is:

```sql
select * from events limit 10 offset 100;
```

This gets the same result: 10 rows after an offset of 100. This is perhaps a
bit more straightforward and reduces the chance that we forget which value is
which like we might in the first syntax variation.

Note: row ordering is only deterministic if you specify an order. To get
consistent results with `offset`, you'll most likely want to be specifying an
`order by` clause as well.

[source](https://dev.mysql.com/doc/refman/8.0/en/select.html)
