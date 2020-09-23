# SSH Into A Docker Container

Before you can SSH into a Docker container, you need to know the name of the
container.

Run

```bash
$ docker ps
```

to list the currently running containers and find the name of the one you want
to connect to. If you don't see the one you are looking for, it may not be
running.

Then, you can connect to it by name with a bash session like so:

```bash
$ docker exec -it <container name> /bin/bash
```

The
[`-it`](http://docs.docker.oeynet.com/engine/reference/commandline/container_exec/)
flags open an interactive emulated terminal connection. `/bin/bash` is the
command that gets run in that context.

[source](https://phase2.github.io/devtools/common-tasks/ssh-into-a-container/)
