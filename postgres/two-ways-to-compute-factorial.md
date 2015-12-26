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

See the [arithmetic function
docs](http://stackoverflow.com/questions/7866353/git-list-all-available-commands)
for more details.
