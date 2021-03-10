# Count How Many Records There Are Of Each Type

Let's say I have a `books` table full of data. One of the columns on this table
is `status` which represents whether the book is published, in review, or still
a draft.

We can find out how many records (books) there are for each `status` using a
`group by` clause and the `count` aggregate function.

```sql
> select status, count(*)
    from books
    group by status;

  status   | count
-----------+-------
 ø         |   123
 published |   611
 draft     |   364
 review    |   239
(4 rows)
```

Because we don't have a `not null` constraint on the `status` column, there are
also some records that have a null value.

We can take this a step further by ordering the output in a consistent
way—descending order of the count column.

```sql
> select status, count(*)
    from books
    group by status
    order by 2 desc;

  status   | count
-----------+-------
 published |   611
 draft     |   364
 review    |   239
 ø         |   123
(4 rows)
```

This `order by` clauses uses [a positional index from the select
arguments](use-argument-indexes.md), so the `2` references the `count(*)`
argument.
