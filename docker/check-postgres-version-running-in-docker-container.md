# Check Postgres Version Running In Docker Container

I have a docker container that I'm using to run a PostgreSQL development
database on my local machine. It was a while ago when I set it up, so I can't
remember specifically which major version of PostgreSQL I am using.

I use `docker ps` to list the names of each container.

```bash
$ docker ps --format "{{.Names}}"
still-postgres-1
better_reads-postgres-1
```

I grab the one I am interested in. In this case, that is `still-postgres-1`.

Then I can execute a `select version()` statement with `psql` against the
container with that name like so:

```bash
$ docker exec still-postgres-1 psql -U postgres -c "select version()";
                                                       version                                                 
---------------------------------------------------------------------------------------------------------------------
 PostgreSQL 16.2 (Debian 16.2-1.pgdg120+2) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
(1 row)
```

And there I have it. I'm running Postgres v16 in this container.
