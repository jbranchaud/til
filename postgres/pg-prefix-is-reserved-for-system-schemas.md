# pg Prefix Is Reserved For System Schemas

Have you ever tried to create a schema with `pg_` as the first part of the
name of the schema? If so, you probably didn't get very far. Postgres won't
let you do that. It reserves the `pg_` prefix for system schemas. If you try
to create a schema in this way, you'll get an *unacceptable schema name*
error.

```sql
> create schema pg_cannot_do_this;
ERROR:  unacceptable schema name "pg_cannot_do_this"
DETAIL:  The prefix "pg_" is reserved for system schemas.
```
