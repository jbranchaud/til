# Creating Custom Types

PostgreSQL has support for creating custom types. When you need something
more expressive than the built-in types and you don't want your data spread
across multiple columns, you can instead create a custom type.

```sql
create type dimensions as (
  width integer,
  height integer,
  depth integer
);
```

This new type can then be used in the definition of a new table

```sql
create table moving_boxes (
  id serial primary key,
  dims dimensions not null
);
```

and when inserting data

```sql
insert into moving_boxes (dims) values (row(3,4,5)::dimensions);
```

See the [`create type`
docs](http://www.postgresql.org/docs/current/static/sql-createtype.html) for
more details.
