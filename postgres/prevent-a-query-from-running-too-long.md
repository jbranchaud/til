# Prevent A Query From Running Too Long

A number of different factors can effect how long a query takes to run.
Certainly the size of a table and the complexity of the query play a big role.
Locking can really slow a query down by making it wait to get started. A series
of competing queries that induce table locking can grind things to a halt.

If you don't want queries in a particular connection being allowed to wait or
run too long, you can set a timeout.

```sql
set statement_timeout to '500';
```

That will ensure that any statement run in that connection will be terminated
if it takes longer than 500ms.

You can also specify a unit:

```sql
set statement_timeout to '15s';
```

That will enforce statement timeout of 15 seconds.

See the
[docs](https://www.postgresql.org/docs/current/runtime-config-client.html) for
more details.
