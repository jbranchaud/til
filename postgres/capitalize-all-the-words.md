# Capitalize All The Words

PostgreSQL provides the string function `initcap()` as a way of capitalizing
all words. In the process, it cleans up the casing of the remaining parts of
the words.

Here are some examples of how it works.

```sql
> select initcap('hello, world');
   initcap
--------------
 Hello, World

> select initcap('HELLO, WORLD');
   initcap
--------------
 Hello, World
```

See the [String Functions and Operators
docs](https://www.postgresql.org/docs/current/static/functions-string.html)
for more details.
