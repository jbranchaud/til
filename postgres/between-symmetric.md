# Between Symmetric

PostgreSQL's `between` construct allows you to make a comparison _between_
two values (numbers, timestamps, etc.).

```sql
> select * from generate_series(1,10) as numbers(a) where numbers.a between 3 and 6;
 a
---
 3
 4
 5
 6
```

If you supply an empty range by using the larger of the two values first, an
empty set will result.

```sql
> select * from generate_series(1,10) as numbers(a) where numbers.a between 6 and 3;
 a
---
```

Tacking `symmetric` onto the `between` construct is one way to avoid this
issue.

```sql
> select * from generate_series(1,10) as numbers(a) where numbers.a between symmetric 6 and 3;
 a
---
 3
 4
 5
 6
```

> BETWEEN SYMMETRIC is the same as BETWEEN except there is no requirement
> that the argument to the left of AND be less than or equal to the argument
> on the right. If it is not, those two arguments are automatically swapped,
> so that a nonempty range is always implied.
