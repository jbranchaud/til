# Run A Basic PostgreSQL Server In Docker

Here is a basic `docker-compose.yml` file for spinning up a Docker container
that runs a PostgreSQL server on port 5432. This is what I use to create a
locally-running PostgreSQL server that lives inside a docker container.

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

To create the docker container and start it up, run the following command from
the same directory where you put this file:

```bash
$ docker compose up
```

This command knows to look for the `docker-compose.yml` file though you can
always be explicit about the file with the `-f` option.

This configuration points at `postgres:latest` which currently is `16.1`. To
run a different major version, you can change the `image` to something like
`postgres:15`. See [Docker Hub](https://hub.docker.com/_/postgres) for more
options.
