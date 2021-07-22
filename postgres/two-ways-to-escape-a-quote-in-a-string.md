# Two Ways To Escape A Quote In A String

String literals in PostgreSQL have to be wrapped in single quotes. This can be
tricky if you are faced with writing out a query using a string that contains a
single quote.

```sql
> select 'who's on first?';
...
```

The query won't execute because it is waiting for you to close the second set
of quotes.

I know of two ways to handle this situation.

The first is to put two single quotes back to back. The first will cause the
second to be escaped so that the quote shows up in the string.

```sql
> select 'who''s on first?';
    ?column?
-----------------
 who's on first?
(1 row)
```

The second is to prepend the string with [the `E`
character](https://www.postgresql.org/docs/current/sql-syntax-lexical.html#SQL-SYNTAX-STRINGS)
to allow escape sequences in strings.

```sql
> select E'who\'s on first?';
    ?column?
-----------------
 who's on first?
(1 row)
```

[source](https://stackoverflow.com/a/12320729)
