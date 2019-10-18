# Check Table For Any Orphaned Records

If you don't have a foreign key constraint in place to enforce the relationship
between records in two different tables, then there are a number of ways you
could end up with orphaned records. Orphaned records are records that have a
value in an `*_id` column when that value doesn't correspond to any record in
the related table.

For example, let's say we have an `authors` table with an `id` column and a
`books` table with an `author_id` column. If there is a book record with an
`author_id` value that doesn't resolve to any record in the `authors` table,
then that book is an orphaned record.

You can find out if a table has orphaned records like so:

```sql
select count(*)
  from books
  left join authors
    on books.author_id = authors.id
  where authors.id is null
    and books.author_id is not null;
```

We select from our table with the foreign key (`books`) and _left join_ it
against the related table (`authors`). If there are any book records where the
joined author row is `null`, then that book is orphaned.
