# Compute Median Instead Of Average

One of the first aggregate functions we might use in PostgreSQL, besides `sum`,
is `avg`.

```sql
select avg(book_count) as average_books_read
from (
  select users.id, count(books.id) as book_count
  from users
  left join books
    on books.user_id = users.id
  where books.read_in_year = 2025
  group by users.id
) as user_book_counts;
```

This computes the average of the set of values which sums them all up
and divides by the count. The average (maybe you've heard this also called the
_mean_) is not always the best way to understand data, especially when there are
outliers.

Instead, we might want to compute the _median_ value of our set of data. There
is no easily identifiable `median` aggregate function. Instead, we can use
`percentile_cont` with a value of `0.5`. This gets us the 50th percentile of our
set of data which is the definition of the _median_.

```sql
select percentile_cont(0.5) within group (
  order by book_count
) as median_books_read
from (
  select users.id, count(books.id) as book_count
  from users
  left join books on books.user_id = users.id and books.read_in_year = 2025
  group by users.id
) as user_book_counts;
```

The full syntax for `percentile_cont` is `percentile_cong(precision) within
group (order by ...)` because this is an aggregiate that has to work with an
ordered-set of data.

[source](https://www.postgresql.org/docs/current/functions-aggregate.html)
