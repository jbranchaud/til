# Change The Owner Of A Sequence

Sequence ownership is one of those things in PostgreSQL that is just under the
surface and so it is easy to not know about it. If, however, you are doing a
live migration where you are swapping out a column or entire table, you'll need
to know about it.

For instance, consider migrating a primary key column from `int` to `bigint`.
Let's say you construct and backfill the new `bigint` column and then swap it
out with the `int` column.

Run a sequence ownership query like [the ones discussed in this
article](https://sadique.io/blog/2019/05/07/viewing-sequence-ownership-information-in-postgres/)
and you'll see that the original `int` column still owns the sequence.

If you try to drop `old_id`, you'll fortunately get a warning from Postgres:

```sql
alter table cats drop column old_id;
ERROR:  cannot drop column old_id of table cats because other objects depend on it
DETAIL:  default value for column id of table cats depends on sequence cats_id_seq
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
```

The `DROP ... CASCADE` suggestion is not the thing to do here. Instead, you'll
want to update the ownership of the sequence to the _new_ `id` column:

```sql
alter sequence cats_id_seq owned by cats.id;
```

[source](https://www.postgresql.org/docs/current/sql-altersequence.html)
