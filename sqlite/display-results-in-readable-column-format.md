# Display Results In Readable Column Format

By default the output of a query or pragma command will be pretty squished and
unreadable.

```sql
sqlite> PRAGMA table_info(User);
0|id|TEXT|1||1
1|name|TEXT|0||0
2|email|TEXT|0||0
3|emailVerified|DATETIME|0||0
4|image|TEXT|0||0
```

However, this can be improved by setting the output `mode` to `column`.

```sql
sqlite> .mode column
```

With that set, we can run the same command which will now output nicely
formatted columns with headers.

```sql
sqlite> PRAGMA table_info(User);
cid  name           type      notnull  dflt_value  pk
---  -------------  --------  -------  ----------  --
0    id             TEXT      1                    1
1    name           TEXT      0                    0
2    email          TEXT      0                    0
3    emailVerified  DATETIME  0                    0
4    image          TEXT      0                    0
```

For more details on this and the many other output modes, check out [the
docs](https://sqlite.org/cli.html#changing_output_formats).
