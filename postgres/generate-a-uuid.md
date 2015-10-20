# Generate A UUID

Postgres has support for universally unique identifiers (UUIDs) as a column
data type via `uuid`. If you have a UUID column, you may need to generate a
UUID.  This requires the `uuid-ossp` module. This module provides a number
of functions for generating UUIDs including the `uuid_generate_v4()`
function which bases the UUID entirely off random numbers.

```sql
> create extension "uuid-ossp";
CREATE EXTENSION
> select uuid_generate_v4();
           uuid_generate_v4
--------------------------------------
 a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
```

See the [postgres docs](http://www.postgresql.org/docs/9.4/static/uuid-ossp.html) for more
details on UUID generation functions.
