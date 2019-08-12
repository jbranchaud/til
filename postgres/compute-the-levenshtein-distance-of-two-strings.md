# Compute The Levenshtein Distance Of Two Strings

PostgreSQL has a built-in function for computing the [Levenshtein
distance](https://en.wikipedia.org/wiki/Levenshtein_distance) between two
strings.

```sql
> select levenshtein('hello', 'world');
 levenshtein
-------------
           4

> select levenshtein('function', 'funtcion');
 levenshtein
-------------
           2
```

Check out the [`fuzzystrmatch`
module](https://www.postgresql.org/docs/current/fuzzystrmatch.html#id-1.11.7.24.6)
for more details.
