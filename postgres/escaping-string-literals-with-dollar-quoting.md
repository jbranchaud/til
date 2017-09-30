# Escaping String Literals With Dollar Quoting

String literals in PostgreSQL are defined by surrounding the content with
the `'` character. For string literals that contain the `'` character, you
may have seen it escaped with a preceding `'`.

```sql
> select 'Isn''t this nice?';
     ?column?
------------------
 Isn't this nice?
```

This is easy enough to do, but can be error prone and doesn't work well if
SQL is being programmatically generated. A great workaround is to escape
string literals using what is called dollar quoting.

```sql
> select $$Isn't this even nicer?$$;
        ?column?
------------------------
 Isn't this even nicer?
```

Just wrap both ends in `$$` instead of `'`.

[source](https://www.postgresql.org/docs/current/static/sql-syntax-lexical.html)
