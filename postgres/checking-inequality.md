# Checking Inequality

In most languages there is a `!=` operator for checking inequality of two
things.

Postgres also supports the synonymous `<>` operator for checking inequality.

```sql
> select 1 <> 1;
 ?column?
----------
 f

> select true <> false;
 ?column?
----------
 t

> select 'taco' <> 'burrito';
 ?column?
----------
 t
```

h/t Brian Dunn

[source](https://www.postgresql.org/docs/9.5/static/functions-comparison.html)
