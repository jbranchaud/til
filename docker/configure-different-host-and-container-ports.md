# Configure Different Host And Container Ports

A `docker-compose.yml` file that sets up something like a PostgreSQL service
will proxy a port from your host machine to a port on the docker container.

A basic PostgreSQL service will look like this tying `5432` to `5432` under the
`ports` section.

```yaml
version: "3.7"
services:
  postgres:
    image: postgres:latest
    restart: always
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=postgres
    ports:
      - "5432:5432"
    volumes:
      - ./postgres-data:/var/lib/postgresql/data
```

Requests like queries from a `psql` instance that we send to `localhost:5432`
will be proxied to `docker-container:5432`.

Since those numbers are the same on both sides, it's not necessarily clear
which is which. The left is the _host_ and the right is the _container_ --
`[host-port]:[container-port]`. 

If you need to use a port other than 5432 on your host machine (e.g. maybe
you're running multiple Postgres servers at once), then you can just change the
port number on the left side. How about `9876:5432`.
