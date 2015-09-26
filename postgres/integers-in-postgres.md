# Integers In Postgres

Postgres has three kinds of integers. Or rather three sizes of integers.
There are `smallint` (`int2`), `integer` (`int4`), and `bigint` (`int8`)
integers. As you might expect, they are 2 byte, 4 byte, and 8 byte integers
respectively. They are also signed integers. All of this has implications
for what ranges of integers can be represented by each type.

The `smallint` integers have 2 bytes to use, so they can be used to
represent integers from -32768 to +32767.

The `integer` integers have 4 bytes to use, so they can be used to represent
integers from -2147483648 to +2147483647.

The `bigint` integers have 8 bytes to use, so they can be used to represent
integers from -9223372036854775808 to +9223372036854775807.

Though columns can be restricted to use a particular-sized integer, postgres
is smart enough to default to `integer` and only use `bigint` as necessary
when working with integers on the fly.

```sql
> select pg_typeof(55);
 pg_typeof
-----------
 integer

> select pg_typeof(99999999999999999);
 pg_typeof
-----------
 bigint
```
