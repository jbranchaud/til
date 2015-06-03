# Extracting Nested JSON Data

If you are storing nested JSON data in a postgres JSON column, you are
likely going to find yourself in a situation where you need to access some
of those nested values in your database code. For instance, you may need to
get at the license number in this JSON column

```sql
  owner
--------------------------------------------------------------------------------
'{ "name": "Jason Borne", "license": { "number": "T1234F5G6", "state": "MA" } }'
```

Unfortunately, the `->` operator isn't going to do the trick. You need the
`json_extract_path` function

```sql
> select json_extract_path(owner, 'license', 'number') from some_table;

 json_extract_path
-------------------
   'T1234F5G6'
```

Read more about [JSON Functions and
Operators](http://www.postgresql.org/docs/9.4/static/functions-json.html).
