# Compute Hashes With pgcrypto

The `pgcrypto` extension that comes with PostgreSQL adds access to some
general hashing functions. Included are `md5`, `sha1`, `sha224`, `sha256`,
`sha384` and `sha512`. Any of these hashing functions can be applied to an
arbitrary string using the `digest` function. Here are example of the `md5`
and `sha1` algorithms:

```sql
> create extension pgcrypto;
CREATE EXTENSION

> select digest('Hello, World!', 'md5');
               digest
------------------------------------
 \x65a8e27d8879283831b664bd8b7f0ad4

> select digest('Hello, World!', 'sha1');
                   digest
--------------------------------------------
 \x0a0a9f2a6772942557ab5355d76af442f8f65e01
```

See the [`pgcrypto` docs](
http://www.postgresql.org/docs/current/static/pgcrypto.html) for more
details.
