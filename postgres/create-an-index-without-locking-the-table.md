# Create An Index Without Locking The Table

When creating an index for a column, the process of building the index will
lock the column's table. For small datasets this isn't a concern because the
index will take no time at all to create. For larger datasets, the lock could
last long enough to create meaningful downtime. This can all be avoided by
telling Postgres to build the index concurrently.

```sql
create index concurrently idx_book_isbns on books(isbn);
```

Creating the index this way will take a bit longer and put more strain on
machine resources, but it allows concurrent inserts, updates, or deletes on the
table. In other words, you can add an index to a large table in a production
environment without bringing down your app.

Read more about the [details and potential
caveats](https://www.postgresql.org/docs/current/sql-createindex.html#SQL-CREATEINDEX-CONCURRENTLY)
in the docs.
