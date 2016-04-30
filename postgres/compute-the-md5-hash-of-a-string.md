# Compute The md5 Hash Of A String

One of the functions provided by PostgreSQL for working with string data is
the `md5()` function. This function calculates the md5 hash of a given string.

It works like this:

```sql
> select md5('Hello, World!');
               md5
----------------------------------
 65a8e27d8879283831b664bd8b7f0ad4

> select md5('$3cr3tp4$$w0rd');
               md5
----------------------------------
 bbabecfd4031211077473734bae7249f
```

There are more hashing algorithms provided by the `pgcrypto` extension. See
[Compute Hashes With pgcrypto](postgres/compute-hashes-with-pgcrypto.md) for
more details on that.
