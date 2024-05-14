# Set Value On Null JSON Column

To set a key-value pair on a JSON field, you can reach for
[MySQL's `json_set`](https://dev.mysql.com/doc/refman/8.0/en/json-modification-functions.html#function_json-set)
or one of [the other JSON setter
functions](https://dev.mysql.com/doc/refman/8.0/en/json-modification-functions.html).

However, if the JSON field you are updating is `null`, you might get an
unexpected result.

```sql
> update User
    set metadata = json_set(metadata, '$.discord_id', 'discord_123')
    where id = 123;

Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0
```

We can see that the `where` clause matched on a single row as expected, but
right above that it says _0 rows affected_.

What happened?

The `json_set` function is not able to set a key-value pair on `null`. It needs
a JSON object to work on.

There are a number of ways to get around this. I find that
[`coalesce`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#function_coalesce)
is a natural way to handle this. If `metadata` happens to be `null`, then we
_coalesce_ it to `'{}'` (an empty object).

```sql
> update User
    set metadata = json_set(coalesce(metadata, '{}'), '$.discord_id', 'discord_123')
    where id = 123;

Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

It updates as expected. That same statement will work on a row where `metadata`
already contains a JSON object since the `coalesce` will resolve to that
instead of the empty object.
