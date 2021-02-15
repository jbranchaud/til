# Find Records That Have Multiple Associated Records

A common type of table association in a relational database is a one-to-many
relationship. For instance, a database representing a bookshelf may have an
`authors` table where each record can be associated with multiple records in
the `books` table. That relationship is represented by a `author_id` foreign
key column on `books` that points to `authors.id`.

We can write a query to find all authors that have not zero or one, but
multiple books by doing a join and then tacking on a `having` clause.

```sql
select authors.id, authors.name, count(books.id)
  from authors
  join books
    on authors.id = books.author_id
  group by authors.id
  having count(books.id) >= 2;
```

This will result in a listing of author ids, author names, and their number of
books.

It does this by joining books to authors, grouping by the `authors.id` to
produce a set of records unique to each author, and then combining multiple
books by aggregating them with a `count`. The `having` clause is necessary
because it is our way of _filtering_ on an aggregate value, in this case the
`count`.
