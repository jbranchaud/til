# Insert A Bunch Of Records With Generate Series

Sometimes you want to quickly insert a bunch of fake (or real) data into a
Postgres table. This is a great way to populate seed data or set up data
scenarios for testing things out.

For instance, I recently used the following query to generate a bunch of data
in a `roles` table to test out a query performance issue.

```sql
> insert into roles (
    name,
    resource_id,
    resource_type,
    created_at,
    updated_at
  )
  select
    'organization_user',
    g.id,
    'Organization',
    now(),
    now()
  from generate_series(1,54000) as g(id);
```

The key part is the [`generate_series()`
function](https://www.postgresql.org/docs/current/functions-srf.html) which
will produce a row for every value between the two arguments. In this case, it
will generate `1`, `2`, `3`, etc. all the way up to `54000` -- so 54k rows in
total.

The query selects off that generated series with some static values and some
timestamps to create sufficiently fake data that can be inserted into the
specified columns of the `roles` table.

This quickly inserts tens of thousands of records that I can now use to test
out the performance of a SQL query.
