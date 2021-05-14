# Find Duplicate Records In Table Without Unique Id

I recently came across a couple methods for listing out instances of duplicate
records in a table where the table doesn't have an explicit unique identifier.
Here is [a post](find-records-that-contain-duplicate-values.md) that explains
how to do this when a unique identifier is present.

If the table doesn't have an explicit primary key or other uniquely identifying
value, then we'll have to get some help from [PostgreSQL's internal system
columns](https://www.postgresql.org/docs/current/ddl-system-columns.html) —
namely the `ctid`.

The `ctid` is:

> The physical location of the row version within its table.

Let's use the example of the `mailing_list` table with potential duplicate
`email` values.

Here is the [first approach](https://stackoverflow.com/a/26773018/535590):

```sql
delete from mailing_list
where ctid not in (
  select min(ctid)
  from mailing_list
  group by email
);
```

This uses a subquery to find the first occurrence of every unique email and
then deletes the rest. The `ctid` is the unique value that we can call the
`min` aggregate on.

A [second approach](https://stackoverflow.com/a/46775289/535590):

```sql
delete from mailing_list ml1
  using mailing_list ml2
where ml1.ctid < ml2.ctid
  and ml1.email = ml2.email;
```

This uses `delete using` to join the table against itself as a cartesian
product to compare every entry to every other entry.
