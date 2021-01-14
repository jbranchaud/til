# Generate Random UUIDs Without An Extension

In other posts I've covered how to generate v4 random UUIDs in PostgreSQL
[using the `uuid-ossp` extension](generate-a-uuid.md) as well as the more
up-to-date method of [using the `pgcrypto`
extension](generating-uuids-with-pgcrypto.md).

As of PostgreSQL v13, you no longer need to add an extension for v4 UUID
generation. It comes built-in as the `gen_random_uuid()` function.

```sql
> select gen_random_uuid();
           gen_random_uuid
--------------------------------------
 0aa72fe6-ede7-4ccf-b328-348becc58066
(1 row)
```

If you need other non-v4 UUID functions, you'll have to stick with
[uuid-ossp](https://www.postgresql.org/docs/current/uuid-ossp.html).
