# References Target Primary Key By Default

Typically when I am creating a table or adding a column that involves a foreign
key constraint, I explicitly name the reference column.

```sql
create table contacts (
  id int generated always as identity primary key,
  user_id int references users(id);
);
```

The [Create Table PostgreSQL
Docs](https://www.postgresql.org/docs/17/sql-createtable.html) point out that
specifying the reference column isn't strictly necessary.

> These clauses specify a foreign key constraint, which requires that a group
> of one or more columns of the new table must only contain values that match
> values in the referenced column(s) of some row of the referenced table. If
> the refcolumn list is omitted, the primary key of the reftable is used.

If we're using the primary key as the reference column, then we can choose to
omit the reference column.

```sql
create table contacts (
  id int generated always as identity primary key,
  user_id int references users;
);
```

In the same way we can do this when adding a column.

```sql
alter table contacts
  add column account_id int references account;
```
