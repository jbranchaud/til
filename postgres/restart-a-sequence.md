# Restart A Sequence

In postgres, if you are truncating a table or doing some other sort of
destructive action on a table in a development or testing environment, you
may notice that the id sequence for the primary key just keeps plugging
along from where it last left off. The sequence can be reset to any value
like so:

```sql
> alter sequence my_table_id_seq restart with 1;
ALTER SEQUENCE
```

[source](http://www.postgresql.org/docs/current/static/sql-altersequence.html)
