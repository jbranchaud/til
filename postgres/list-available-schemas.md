# List Available Schemas

Use the `\dn` command within a `psql` session to list the available schemas.
This will only included user created schemas. This means that schemas like
`public` will be listed whereas schemas like `information_schema` and
`pg_catalog` will not.

You can use `\dnS` to also list system schemas.

[source](http://www.postgresql.org/docs/current/static/app-psql.html)
