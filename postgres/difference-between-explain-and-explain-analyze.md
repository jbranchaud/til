# Difference Between Explain And Explain Analyze

The `explain` statement allows you to gain some insight into the performance of
a query. You may hear `explain` and `explain analyze` referred to
interchangeably in conversation. Though they can both be used to explore how a
query will perform, it's important to know a key difference. `explain analyze`
executes the query, `explain` does not.

For `select` queries, the distinction may not feel that important. For
`insert`s, `update`s, and `delete`s, you'll want to be clear about which one
you are using.

```sql
> explain insert into books (title, author) values ('Fledgling', 'Octavia Butler');
                     QUERY PLAN
----------------------------------------------------
 Insert on books  (cost=0.00..0.01 rows=1 width=76)
   ->  Result  (cost=0.00..0.01 rows=1 width=76)

> select count(*) from books;
 count
-------
     0
```

With `explain`, you get cost estimates of the `insert` statement.

```sql
> explain analyze insert into books (title, author) values ('Fledgling', 'Octavia Butler');
                                          QUERY PLAN
----------------------------------------------------------------------------------------------
 Insert on books  (cost=0.00..0.01 rows=1 width=76) (actual time=0.285..0.285 rows=0 loops=1)
   ->  Result  (cost=0.00..0.01 rows=1 width=76) (actual time=0.012..0.012 rows=1 loops=1)
 Planning time: 0.021 ms
 Execution time: 0.309 ms

> select count(*) from books;
 count
-------
     1
```

With `explain analyze`, you get estimates and actual numbers. You also get a
row inserted in the `books` table.
