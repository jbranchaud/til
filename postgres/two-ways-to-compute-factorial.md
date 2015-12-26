# Two Ways To Compute Factorial

In PostgreSQL, there are two ways to compute the factorial of a number.
There is a prefix operator and a postfix operator. The prefix operator is
`!!` and can be used like so:

```sql
> select !!5;
 ?column?
----------
      120
```

The postfix operator is `!` and can be used like so:

```sql
> select 5!;
 ?column?
----------
      120
```

See the [mathematical functions and operators
docs](http://www.postgresql.org/docs/8.1/static/functions-math.html)
for more details.
