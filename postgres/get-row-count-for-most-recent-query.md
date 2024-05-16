# Get Row Count For Most Recent Query

Anytime you execute a query in `psql`, there is a _row count_ associated with
that query. This is most naturally understood with a `select` query where a
discreet number of rows are returned. We typically see the row count (e.g. `(19
rows)`) right below the result set.

You can always reference the row count of the most recent query with [the
`:ROW_COUNT`
variable](https://www.postgresql.org/docs/current/app-psql.html#APP-PSQL-VARIABLES-ROW-COUNT).
Here we use `\echo` to print it out.

```sql
> select generate_series(2,20);
 generate_series
-----------------
               2
               3
               4
               5
               6
               7
               8
               9
              10
              11
              12
              13
              14
              15
              16
              17
              18
              19
              20
(19 rows)

Time: 12.338 ms
> \echo :ROW_COUNT
19
```

For some queries, like one that induces a pager (e.g. `less`) to be used,
you'll lose track of the row count once the pager closes. This is where being
able to reference the row count without rerunning the query is most useful.

```sql
> select generate_series(2,2000);
Time: 9.815 ms
> \echo :ROW_COUNT
1999
```

Notice, we can also get a row count from other kinds of queries like this
`insert` statement.

```sql
> insert into users (id) values (50001), (50002), (50003);
INSERT 0 3
Time: 2.804 ms
> \echo :ROW_COUNT
3
```

[source](https://postgresql.verite.pro/blog/2024/05/13/advanced-psql-coproc.html)
