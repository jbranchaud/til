# Idempotent Inserts

I'm writing a bunch of records from one table to another using
[`insert`](https://www.postgresql.org/docs/current/sql-insert.html). This is
part of a process to swap out a massive table with an identical version that
has a fraction of the records.

I want to copy a subset of rows from the primary table to the replacement table
that meet certain criteria. This query should be re-runnable and idempotent.
That way I can run it, investage the replacement table, and then run it again
before swapping out the tables. This helps ensure I don't miss anything.

Such an idempotent query can be written with the help of the `on conflict`
clause.

```sql
insert into replacement_table
select * from original_table
where created_at > (now() - '3 months'::interval)
on conflict do nothing;
```

If I run that multiple times, it skips over any records that would otherwise
cause a conflict. The unique primary key column is usually what determines a
conflicting record.

Without the `on conflict do nothing`, trying to run this `insert` multiple
times will fail on subsequent runs when it tries to re-insert rows with primary
keys it has already inserted.
