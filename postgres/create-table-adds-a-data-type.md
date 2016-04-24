# Create Table Adds A Data Type

Each time you create a table in PostgreSQL, a new data type represented by
that table is created and added to the `pg_type` table. According to the
Postgres docs:

> CREATE TABLE also automatically creates a data type that represents the
> composite type corresponding to one row of the table. Therefore, tables
> cannot have the same name as any existing data type in the same schema.

For instance, if you create a `users` table like so:

```sql
create table users (
  id serial primary key,
  first_name varchar not null,
  last_name varchar not null
);
```

then the `pg_type` will now contain an entry with a `typname` of `users`.

```sql
select * from pg_type where typname = 'users';
-[ RECORD 1 ]--+------------
typname        | users
typnamespace   | 2200
typowner       | 16384
...
```

h/t Bruce Momjian
