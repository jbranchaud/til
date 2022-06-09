# Use Rename To Hot Swap Two Tables

The [`alter
table`](https://www.postgresql.org/docs/current/sql-altertable.html) command
can be used to [rename a
table](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-rename-table/).
Because it is changing the name of a reference rather than actually moving any
data around, it is very fast.

We can exploit the speed of a _rename_ to hot swap two tables. This is useful
for a situation where we've created an identical table with a small fraction of
the data of the original table. By hot swapping them, we've exchanged the large
table for a smaller one without our application code noticing anything
happened.

Let's assume we have a massive `events` table and then a much smaller
`new_events` table with the same structure.

The following transaction will swap those two tables in the blink of an eye.

```sql
begin;

alter table events rename to old_events;
alter table new_events rename to events;

commit;
```

The resulting `old_events` table can then be deleted at our convenience.

The other nice thing about this approach is that, before deleting `old_events`,
you can easily and quickly swap them back using the same approach. It is always
a comfort when huge changes like this are easy to reverse if necessary.
