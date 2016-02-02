# Get The Size Of A Database

If you have connect access to a PostgreSQL database, you can use the
`pg_database_size()` function to get the size of a database in bytes.

```sql
> select pg_database_size('hr_hotels');
 pg_database_size
------------------
          8249516
```

Just give it the name of the database and it will tell you how much disk
space that database is taking up.

Checkout [the Postgres docs](http://www.postgresql.org/docs/current/static/functions-admin.html) for more details.
