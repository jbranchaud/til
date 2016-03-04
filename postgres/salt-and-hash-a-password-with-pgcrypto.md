# Salt And Hash A Password With pgcrypto

The
[`pgcrypto`](http://www.postgresql.org/docs/current/static/pgcrypto.html)
extension that ships with PostgreSQL can be used to do a number of
interesting things. This includes functions for doing salted password
hashing. Using the `crypt` and `gen_salt` functions, we can securely store a
user password and later compare it to plain-text passwords for
authentication purposes.

```sql
create extension pgcrypto;

select crypt('pa$$w0rd', gen_salt('bf'));
                            crypt
--------------------------------------------------------------
 $2a$06$Z7wmrkYMOyLboLcULUYzNe6nHUcWywSZTt6nSrT5Xdv/VLdJ4g99K

> select (
    '$2a$06$Z7wmrkYMOyLboLcULUYzNe6nHUcWywSZTt6nSrT5Xdv/VLdJ4g99K' =
    crypt(
      'pa$$w0rd',
      '$2a$06$Z7wmrkYMOyLboLcULUYzNe6nHUcWywSZTt6nSrT5Xdv/VLdJ4g99K'
    )
  ) as matched;
 matched
---------
 t

> select (
    '$2a$06$Z7wmrkYMOyLboLcULUYzNe6nHUcWywSZTt6nSrT5Xdv/VLdJ4g99K' =
    crypt(
      'password',
      '$2a$06$Z7wmrkYMOyLboLcULUYzNe6nHUcWywSZTt6nSrT5Xdv/VLdJ4g99K'
    )
  ) as matched;
 matched
---------
 f
```

The salt value is generated using the blowfish encryption algorithm (hence,
the `'bf'`). There is support for other algorithms such as `md5`.

See the
[`pgcrypt` documentation](http://www.postgresql.org/docs/current/static/pgcrypto.html) for
more details.
