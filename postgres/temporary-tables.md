# Temporary Tables

Create a temporary table in Postgres like so

```sql
create temp table posts (
    ...
);
```

This table (and its data) will only last for the duration of the session.
It is created on a schema specific to temporary tables. It is also worth
noting that it won't be autovacuumed, so this must be done manually as
necessary.
