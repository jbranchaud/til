# Run SQL Script Against Postgres Container

I've been using dockerized Postgres for local development with several projects
lately. This is typically with framework tooling (like Rails) where schema
migrations and query execution are handled by the tooling using the specified
connection parameters.

However, I was experimenting with and iterating on some Postgres functions
outside of any framework tooling. I needed a way to run the SQL script that
(re)creates the function via `psql` on the docker container.

With a local, non-containerized Postgres instance, I'd redirect the file to
`psql` like so:

```bash
$ psql -U postgres -d postgres < experimental-functions.sql
```

When I tried doing this with `docker exec` though, it was silently failing /
doing nothing. As far as I can tell, there was a mismatch with redirection
handling across the bounds of the container.

To get around this, I first copy the file into the `/tmp` directory on the
container:

```bash
$ docker cp experimental-functions.sql still-postgres-1:/tmp/experimental-functions.sql
```

Then the `psql` command that docker executes can be pointed directly at a
local-to-it SQL file.

```bash
$ docker exec still-postgres-1 psql \
  -U postgres \
  -d postgres \
  -f /tmp/experimental-functions.sql
```

There are probably other ways to handle this, but I got into a nice rhythm with
this file full of `create or replace function ...` definitions where I could
modify, copy over, execute, run some SQL to verify, and repeat.
