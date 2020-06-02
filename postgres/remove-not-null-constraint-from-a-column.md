# Remove Not Null Constraint From A Column

When you want to add a [`not
null`](https://www.postgresql.org/docs/current/ddl-constraints.html#id-1.5.4.6.6)
constraint to a column, you do so by _setting_ it.

```sql
alter table books
  alter column publication_date
  set not null;
```

You can remove a `not null` constraint from a column, by _dropping_ it.

```sql
alter table books
  alter column publication_date
  drop not null;
```

Notice this excerpt of syntax from the official Postgres docs:

```
... ALTER [ COLUMN ] column_name { SET | DROP } NOT NULL
```

[source](https://www.postgresql.org/docs/current/sql-altertable.html)
