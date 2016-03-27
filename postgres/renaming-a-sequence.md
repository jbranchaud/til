# Renaming A Sequence

If a table is created with a `serial` type column, then a sequence is also
created with a name based on the name of the table.

```sql
> \d
            List of relations
 Schema |       Name      |   Type   |   Owner
--------+-----------------+----------+------------
 public | accounts        | table    | jbranchaud
 public | accounts_id_seq | sequence | jbranchaud
```

In [Renaming A Table](renaming-a-table.md), I showed how a table can be
renamed in PostgreSQL. This will not, however, rename associated sequences.
To maintain naming consistency, you may want to also rename sequences when
renaming tables. This can be done with a query like the following:

```sql
> alter sequence accounts_id_seq rename to users_id_seq;
```

See the [`alter
sequence`](http://www.postgresql.org/docs/current/static/sql-altersequence.html)
docs for more details.
