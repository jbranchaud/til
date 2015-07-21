# List All Versions Of A Function

Within `psql` you can use `\df` to list a postgres function with a given
name

```sql
> \df now
                              List of functions
   Schema   | Name |     Result data type     | Argument data types |  Type
------------+------+--------------------------+---------------------+--------
 pg_catalog | now  | timestamp with time zone |                     | normal
(1 row)
```

When a function has multiple definitions across a number of types, `\df`
will list all versions of that function

```sql
> \df generate_series
List of functions
-[ RECORD 1 ]-------+-------------------------------------------------------------------
Schema              | pg_catalog
Name                | generate_series
Result data type    | SETOF bigint
Argument data types | bigint, bigint
Type                | normal
-[ RECORD 2 ]-------+-------------------------------------------------------------------
Schema              | pg_catalog
Name                | generate_series
Result data type    | SETOF bigint
Argument data types | bigint, bigint, bigint
Type                | normal
-[ RECORD 3 ]-------+-------------------------------------------------------------------
Schema              | pg_catalog
Name                | generate_series
Result data type    | SETOF integer
Argument data types | integer, integer
Type                | normal
-[ RECORD 4 ]-------+-------------------------------------------------------------------
Schema              | pg_catalog
Name                | generate_series
Result data type    | SETOF integer
Argument data types | integer, integer, integer
Type                | normal
-[ RECORD 5 ]-------+-------------------------------------------------------------------
Schema              | pg_catalog
Name                | generate_series
Result data type    | SETOF timestamp with time zone
Argument data types | timestamp with time zone, timestamp with time zone, interval
Type                | normal
-[ RECORD 6 ]-------+-------------------------------------------------------------------
Schema              | pg_catalog
Name                | generate_series
Result data type    | SETOF timestamp without time zone
Argument data types | timestamp without time zone, timestamp without time zone, interval
Type                | normal
```
