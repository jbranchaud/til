# Prevent Containers From Running On Startup

I have a bunch of docker containers managed by Docker Desktop. Some are related
to projects I'm actively working on. Whereas many others are inactive projects.

When I restart my machine, regardless of which containers I had running or
turned off, several of them are booted into a running state on startup. This is
becaue their restart policy is set to `always`. That's fine for the project I'm
actively working on, but the others I would like to be _off_ by default.

I need to update each of their restart policies from `always` to `no`.

First, I need to figure out their container IDs:

```bash
$ docker ps --all
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS                       PORTS                    NAMES
eb7b40aeba2d   postgres:latest          "docker-entrypoint.s…"   3 months ago    Up 11 minutes                0.0.0.0:9875->5432/tcp   still-postgres-1
eb9ab2213f2b   postgres:latest          "docker-entrypoint.s…"   3 months ago    Exited (0) 11 minutes ago                             next-drizzle-migration-repro-app-postgres-1
ba792e185734   postgres:latest          "docker-entrypoint.s…"   4 months ago    Up 11 minutes                0.0.0.0:9876->5432/tcp   better_reads-postgres-1
3139f9beae76   postgres:latest          "docker-entrypoint.s…"   9 months ago    Exited (128) 7 months ago                             basic-next-prisma-postgres-1
```

Referencing the `CONTAINER ID` and `NAMES` columns, I'm able to then inspect
each container and see the current `RestartPolicy`:

```bash
$ docker inspect eb9ab2213f2b | grep -A3 RestartPolicy
"RestartPolicy": {
    "Name": "always",
    "MaximumRetryCount": 0
},
```

I can then update the `RestartPolicy` to be `no`:

```bash
$ docker update --restart no eb9ab2213f2b
```

Inpsecting that container again, I can see the updated policy:

```bash
$ docker inspect eb9ab2213f2b | grep -A3 RestartPolicy
"RestartPolicy": {
    "Name": "no",
    "MaximumRetryCount": 0
},
```

Rinse and repeat for each of the offending containers.

[source](https://stackoverflow.com/questions/45423334/stopping-docker-containers-from-being-there-on-startup)
