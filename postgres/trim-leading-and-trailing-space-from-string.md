# Trim Leading And Trailing Space From String

PostgreSQL has a bunch of [string
functions](https://www.postgresql.org/docs/current/functions-string.html),
including several for doing various string trimming.

We can use the simplest form of `trim` to remove leading and trailing space
characters from a string.

```sql
> select trim('  Taco Cat ');
+----------+
| btrim    |
|----------|
| Taco Cat |
+----------+
```

The syntax for calling `trim` is a bit odd relative to other PostgreSQL
functions and functions in other languages. Here is the "grammar" as described
in the docs:

```
trim ( [ LEADING | TRAILING | BOTH ] [ characters text ] FROM string text ) → text
```

We pick `leading`, `trailing`, or `both`, with `both` being the default. Then
we specify the character(s) we want to remove. This is also optional, the
default being the space character. Then we say `from` what string we want to
trim those characters.

Here we remove all sequential spaces from `both` ends of the given string:

```sql
> select trim(both from '  Taco Cat ');
+----------+
| btrim    |
|----------|
| Taco Cat |
+----------+
```

To further demonstrate how `trim` works, here we remove all sequences made up
of any of spaces, uppercase `T`, and lowercase `t` from `both` ends of the
string:

```sql
> select trim(both ' Tt' from '  Taco Cat ');
+--------+
| btrim  |
|--------|
| aco Ca |
+--------+
```

Notice that in all the above examples the column name of the result is `btrim`.
That's probably because `btrim` (_trim both ends_) is being called under the
hood for the `both` option.
