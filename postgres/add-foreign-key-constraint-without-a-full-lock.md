# Add Foreign Key Constraint Without A Full Lock

Adding a foreign key constraint to a large production table can cause a full
table lock resulting in downtime. This is because the entire table needs to be
scanned to check that the constraint is valid.

The amount of locking, and ultimately the impact on your app, can be reduced by
spreading this action across two commands. First is to add the constraint
without checking that all the existing records are valid.

```sql
alter table books
  add constraint fk_books_authors
  foreign key (author_id)
  references authors(id)
  not valid;
```

The constraint will be added immediately and any subsequent inserts or updates
will be subject to the new foreign key constraint.

The second step is to make this constraint valid for all the existing rows.

```sql
alter table books validate constraint fk_books_authors;
```

This "validation acquires only a SHARE UPDATE EXCLUSIVE lock on the table being
altered." This is lower impact than a full table lock.

[Source](https://www.postgresql.org/docs/current/sql-altertable.html#SQL-ALTERTABLE-NOTES)
