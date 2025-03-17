# Fetch Data From An Endpoint In SQL

The [`pgsql-http` extension](https://github.com/pramsey/pgsql-http) provides a
variety of functions for allowing PostgreSQL to act as an HTTP client. This is
a bit unorthodox and may not be a good idea in production systems. That said,
it is cool that it is possible. Let's look at an example of it.

First, I've installed the extension on the Docker container running my local
Postgres server.

```bash
$ docker exec -it still-postgres-1 bash

$ apt-get update

$ apt-get install postgres-16-http # I'm running Postgres v16

$ exit
```

Then I'll connect to a `psql` session in that container for the `postgres` database.

```bash
$ docker exec still-postgres-1 psql -U postgres -d postgres
```

Then I enable the extension.

```sql
> create extension if not exists http;
CREATE EXTENSION
```

Now I can point a PostgreSQL statement at a live endpoint like
[https://httpbun.com/ip](https://httpbun.com/ip) which will respond with a
chunk of JSON including the IP address for that project's server. I do this
using `http_get` which makes a `GET` request to the given endpoint. The body is
included in the result set.

```bash
> select content from http_get('http://httpbun.com/ip');
           content
-----------------------------
 {                          +
   "origin": "73.75.236.101"+
 }                          +

(1 row)
```
