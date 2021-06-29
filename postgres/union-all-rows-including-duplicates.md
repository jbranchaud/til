# Union All Rows Including Duplicates

Two tables or sets of results can be joined together into a single result set
using [the `union`
operator](https://www.postgresql.org/docs/current/queries-union.html). When
combining results with `union`, all duplicate rows will be removed from its
result.

```sql
> select generate_series(1,4)
  union
  select generate_series(3,6)
  order by 1 asc;

 generate_series
-----------------
               1
               2
               3
               4
               5
               6
(6 rows)
```

Notice that despite both sides of the `union` having their own 3 and 4, those
values each only show up once in the result.

If we don't want duplicates to be excluded, we can use `union all`.

```sql
> select generate_series(1,4)
  union all
  select generate_series(3,6)
  order by 1 asc;

 generate_series
-----------------
               1
               2
               3
               3
               4
               4
               5
               6
(8 rows)
```

In this case we have 8 rows instead of 6 with the values 3 and 4 each appearing
twice.

[source](https://www.postgresqltutorial.com/postgresql-union/)
