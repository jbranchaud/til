# Generate Random Alphanumeric Identifier

Here is a PostgreSQL query that uses
[`pgcrypto`](https://www.postgresql.org/docs/current/pgcrypto.html) (for
[`get_random_bytes`](https://www.postgresql.org/docs/current/pgcrypto.html#PGCRYPTO-RANDOM-DATA-FUNCS))
and a CTE to generate a cryptographically-random 8-character alphanumeric
identifier.

```sql
-- First ensure pgcrypto is installed
create extension if not exists pgcrypto;

-- Generates a single 8-character identifier
with chars as (
  -- excludes some look-alike characters
  select '23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz' as charset
),
random_bytes as (
  select gen_random_bytes(8) as bytes
),
positions as (
  select generate_series(0, 7) as pos
)
select string_agg(
  substr(
    charset,
    (get_byte(bytes, pos) % length(charset)) + 1,
    1
  ),
  '' order by pos
) as short_id
from positions, random_bytes, chars;
```

Here is an example of the output:

```sql
+----------+
| short_id |
|----------|
| NXdu9AnV |
+----------+
```

The
[`generate_series`](https://www.postgresql.org/docs/current/functions-srf.html)
gives us an 8-row table from 0 to 7 that we can use as indexes into the byte
positions of the value we get from `gen_random_bytes`. Those random bytes get
mapped to individual alphanumeric characters from `chars`. That then gets
squeezed together with `string_agg`.

Note: the character set excludes some characters that can be mistaken for one
another like `0` and `O` or `1` and `l`.

Note: you could change the right-bound of the `generate_series` to generate a
different length identifier.
