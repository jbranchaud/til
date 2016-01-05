# Restarting Sequences When Truncating Tables

PostgreSQL's
[`truncate`](http://www.postgresql.org/docs/current/static/sql-truncate.html)
feature is a handy way to clear out all the data from a table. If you use
`truncate` on a table that has a `serial` primary key, you may notice that
subsequent insertions keep counting up from where you left off. This is
because the sequence the table is using hasn't been restarted. Sure, you can
restart it manually or you can tell `truncate` to do it for you. By
appending `restart identity` to the end of a `truncate` statement, Postgres
will make sure to restart any associated sequences at `1`.

```sql
truncate pokemons, trainers, pokemons_trainers restart identity;
```
