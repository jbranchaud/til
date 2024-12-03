# Fetch Specific Number Of Results

If you pull up just about any intro to PostgreSQL (or even SQL), one of the
first things they are going to teach you is the `limit` clause. This is taught
as _the_ way for limiting the result set to a specific number of rows.

```sql
> select title from books limit 4;
+-----------------------+
| title                 |
|-----------------------|
| The Secret History    |
| A Gentleman in Moscow |
| Exhalation: Stores    |
| Annihilation          |
+-----------------------+
SELECT 4
```

You might be as surprised as I was to learn that `limit` is not part of the SQL
standard. It is extremely common for this use case, but the SQL standard
defines `fetch first N rows only` as the way to fetch a specific number of
rows. As we can see, [it works identically to `limit
N`](https://www.postgresql.org/docs/current/sql-select.html#SQL-LIMIT).

```sql
> select title from books fetch first 4 rows only;
+-----------------------+
| title                 |
|-----------------------|
| The Secret History    |
| A Gentleman in Moscow |
| Exhalation: Stores    |
| Annihilation          |
+-----------------------+
SELECT 4
```

The `rows` and `row` keywords are interchangeable which makes statements more
readable if, for instance, you're doing `... fetch first 1 row only`.

[source](https://www.cybertec-postgresql.com/en/postgresql-limit-vs-fetch-first-rows-with-ties/)
