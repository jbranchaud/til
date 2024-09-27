# Generate Modern Primary Key Columns

Chances are if you have looked at some examples, blog posts, or real-world
instances of a `create table` statement, it defined the primary key with
`serial` (or `bigserial`).

```sql
create table books (
  id serial primary key,
  title text not null,
  author text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
```

The `serial` syntax is everywhere, but for quite a while now it has not been
the recommended way to define a primary key column for the `int` or `bigint`
data types.

The ["Don't Do This" page of the PostgreSQL
wiki](https://wiki.postgresql.org/wiki/Don%27t_Do_This#Don.27t_use_serial) says
"Don't use serial".

> For new applications, identity columns should be used instead. The serial
> types have some weird behaviors that make schema, dependency, and permission
> management unnecessarily cumbersome.

The modern way to define a primary key column for `int` or `bigint` is with a
generated identity column.

```sql
create table books (
  id int primary key generated always as identity,
  title text not null,
  author text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
```

Check out the PostgreSQL docs for more about [identity
columns](https://www.postgresql.org/docs/17/ddl-identity-columns.html).
