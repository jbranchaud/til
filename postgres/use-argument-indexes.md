# Use Argument Indexes

In Postgres, each of the arguments you specify in a `select` statement has a
1-based index tied to it. You can use these indexes in the `order by` and
`group by` parts of the statement.

Instead of writing

```sql
select id, updated_at from posts order by updated_at;
```

you can write

```sql
select id, updated_at from posts order by 2;
```

If you want to group by a table's `type` and then order by the counts from
highest to lowest, you can do the following

```sql
select type, count(*) from transaction group by 1 order by 2 desc;
```
