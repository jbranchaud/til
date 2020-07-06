# Determine Types Of JSONB Records

You can stick several different things into a [JSONB postgres
column](https://www.postgresql.org/docs/9.4/datatype-json.html).

> Possible types are object, array, string, number, boolean, and null.

If you are trying to audit what is in them, you might reach for:

```sql
> select pg_typeof(my_jsonb_column) from my_table;
```

That is just gonna spit out `jsonb` over and over, like, I already know that.

What you really want to know is, is the top-level thing an _object_, an
_array_, or maybe just a _string_ or _number_. There are specific JSON
processing functions for this, `json_typeof` and `jsonb_typeof` which you can
call like so:

```sql
> select jsonb_typeof(my_jsonb_column) from my_table;
 jsonb_typeof
--------------
 object
 array
 ...
```

[source](https://www.postgresql.org/docs/9.5/functions-json.html)
