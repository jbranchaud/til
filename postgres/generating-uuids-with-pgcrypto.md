# Generating UUIDs With pgcrypto

If you check out the docs for the [`uuid-ossp`
extension](https://www.postgresql.org/docs/current/static/uuid-ossp.html),
you'll come across the following message.

> The OSSP UUID library... is not well maintained, and is becoming
> increasingly difficult to port to newer platforms. 

A little bit later, it says:

> If you only need randomly-generated (version 4) UUIDs, consider using the
> gen_random_uuid() function from the pgcrypto module instead.

So, if we are using the UUID data type and only need to generate random
UUIDs, we can rely on the [`pgcrypto`
extension](https://www.postgresql.org/docs/current/static/pgcrypto.html). It
comes with the `gen_random_uuid()` function which generates random v4 UUIDs.

```sql
> create extension "pgcrypto";
CREATE EXTENSION

> select gen_random_uuid();
           gen_random_uuid
--------------------------------------
 0a557c31-0632-4d3e-a349-e0adefb66a69

> select gen_random_uuid();
           gen_random_uuid
--------------------------------------
 83cdd678-8198-4d56-935d-d052f2e9db37
```
