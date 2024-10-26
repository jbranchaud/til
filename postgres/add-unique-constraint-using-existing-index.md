# Add Unique Constraint Using Existing Index

Adding a unique constraint to an existing column on a production table can
block updates. If we need to avoid this kind of locking for the duration of
index creation, then we can first create the index concurrently and then use
that existing index to back the unique constraint.

```sql
create index concurrently users_email_idx on users (email);

-- wait for that to complete

alter table users
  add constraint unique_users_email unique using index users_email_idx;
```

First, we concurrently create the index. The time this takes will depend on how
large the table is. That's the blocking time we are avoiding with this
approach. Then once that completes we can apply a unique constraint using that
preexisting index.

Note: if a non-unique value exists in the table for that column, adding the
constraint will fail. You'll need to deal with that _duplicate_ value first.

[source](https://dba.stackexchange.com/questions/81627/postgresql-9-3-add-unique-constraint-using-an-existing-unique-index)
