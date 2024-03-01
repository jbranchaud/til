# Connect To A Database In Safe Update Mode

The MySQL client has a _Safe-Updates Mode_ that you can use when connecting to
a database. When this mode is active, the client will interrupt `update` and
`delete` commands that don't specify a `where` clause that filters by a _key_
value. That, or you need to explicitly `limit` the number of rows impacted by
the query.

To start a connection in this mode, you can use either the `--safe-updates`
flag or the cheekier `--i-am-a-dummy` flag.

```bash
$ mysql --i-am-a-dummy -h ::1 -P 3309 -u root -D my-database
```

Then if you try to do an unrestricted `update` or `delete`, you'll see the
following message:

```sql
mysql> update users set email = 'oops@email.com';
ERROR 1175 (HY000): You are using safe update mode and you tried to update
a table without a WHERE that uses a KEY column.
```

This can also be set within the connection like so:

```sql
mysql> set sql_safe_updates=1;
```

[source](https://dev.mysql.com/doc/refman/8.0/en/mysql-tips.html#safe-updates)
