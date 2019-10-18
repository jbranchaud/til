# Count The Number Of Trues In An Aggregate Query

The `sum` function is an aggregate function that allows you to sum up a bunch
of integers. What if you want to sum up a boolean column? You may want to know
how many times `true` appears in a collection of grouped records.

This can be done by mixing in a `case` statement.

```sql
select
  author_id,
  sum(case when available then 1 else 0 end)
from books
group by author_id;
```

Here, we are able to find out for each author how many books they have
available.

If we want to count `false` values, we can just invert the `sum` statement:

```sql
sum(case when available then 0 else 1 end)
```

[source](https://stackoverflow.com/a/5396728/535590)
