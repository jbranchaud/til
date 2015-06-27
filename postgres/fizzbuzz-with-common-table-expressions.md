# Fizzbuzz With Common Table Expressions

In learning about CTEs (common table expressions) in postgres, I discovered
that you can do some interesting and powerful things using the `with
recursive` construct. The following solves the fizzbuzz problem for integers
up to 100

```sql
with recursive fizzbuzz (num,val) as (
    select 0, ''
    union
    select (num + 1),
      case
      when (num + 1) % 15 = 0 then 'fizzbuzz'
      when (num + 1) % 5  = 0 then 'buzz'
      when (num + 1) % 3  = 0 then 'fizz'
      else (num + 1)::text
      end
    from fizzbuzz
    where num < 100
)
select val from fizzbuzz where num > 0;
```

Check out [With Queries (Common Table Expressions)](http://www.postgresql.org/docs/9.4/static/queries-with.html)
for more details on CTEs.
