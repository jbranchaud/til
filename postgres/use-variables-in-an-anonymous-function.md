# Use Variables In An Anonymous Function

I was curious how variables could be declared and used in PostgreSQL, so I did
a little experiment with a `books` and `authors` schema.

Variables need to be declared and used within the context of a function. Using
the [`do` syntax](https://www.postgresql.org/docs/9.1/sql-do.html) I am able to
declare and execute an anoymous code block.

Within that code block I can declare one or more variables by giving them a
type and optionally a default value. Below I declare `author_id` with a default
and `result` as a `record` type.

```sql
do $$
declare
  author_id varchar := 'e2b42ebf-7ea9-4d9e-8edf-310fc1894bcd';
  result record;
begin
  for result in select title from books where "authorId" = author_id
  loop
    raise notice '| % |', result.title;
  end loop;
end $$;
```

I'm able to use the `author_id` variable directly in a `select` statement.

```sql
select title from books where "authorId" = author_id
```

and then using a [for
loop](https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-RECORDS-ITERATING)
with my `result` of `record` type, I can iterate over each of the results from
the `select`.

Because this anonymous `do` block implicitly has a `void` return type, I need
to do something with the result within the block. For demonstration purposes, I
use [`raise
notice`](https://www.postgresql.org/docs/current/plpgsql-errors-and-messages.html)
to log out each book title.
