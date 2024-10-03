# List Running Docker Containers

The `docker` CLI has a `ps` command that will list all running container by
default.

When I run it, I can see that I have a container running a Postgres database
and another running a MySQL database.

```bash
$ docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED         STATUS         PORTS                               NAMES
ba792e185734   postgres:latest   "docker-entrypoint.s…"   12 days ago     Up 12 days     0.0.0.0:9876->5432/tcp              better_reads-postgres-1
7ca7c1e882e0   mysql:8.0         "docker-entrypoint.s…"   19 months ago   Up 8 seconds   33060/tcp, 0.0.0.0:3309->3306/tcp   some-app-db-1
```

It lists several pieces of info about the containers: the container id, the
image it is based off, when it was created, the running status, the port
configuration, and the name of the container

If I run `docker ps --help` I can see some additional options. One option is
the `--all` flag which will display all known docker container instead of just
the running ones.
