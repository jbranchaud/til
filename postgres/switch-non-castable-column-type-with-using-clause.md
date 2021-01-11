# Switch Non-Castable Column Type With Using Clause

With certain data types, such as from `int` to `bigint` or `timestamptz` to
`timestamp`, there is an automatic type casting that can take place with
existing data. This means Postgres knows how to handle a data type change
like:

```sql
alter table users
  alter column id
  set data type bigint;
```

With other data types, such as `int` to `uuid`, there is no way for Postgres to
know how to automatically cast it. To change the data type of a column in a
scenario like this, you have to tell Postgres how to handle the conversion with
a `using` clause.

```sql
alter table users
  alter column id
  set data type uuid using (gen_random_uuid());
```

In this instance, the `using` clause tells Postgres to ignore the existing
integer `id` value and use the `gen_random_uuid()` function to generate a UUID
value to take its place.

The `using` clause can also reference the existing column value as part of its
type cast.

See the [alter table
documentation](https://www.postgresql.org/docs/current/sql-altertable.html) for
more details on this.
