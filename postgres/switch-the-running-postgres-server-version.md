# Switch The Running Postgres Server Version

I use [asdf](https://github.com/asdf-vm/asdf) install and manage multiple
versions of Postgres on my Mac OSX machine. With `asdf` and project-based
`.tools-versions` files, I can control what version of Postgres (`psql`) I use
at a project-level.

The one snag with this workflow is managing the currently running server
version.  Lets say I need to switch from a project using `12.3` to a project
using `13.1`. If the Postgres server running on my machine is using the
Postgres server 12.3, then I'll need to manually stop that server and start up
the Postgres server 13.1.

This can be done like so:

```bash
# stop the 12.3 server
$ $HOME/.asdf/installs/postgres/12.3/bin/pg_ctl \
    -D $HOME/.asdf/installs/postgres/12.3/data \
    stop

# start the 13.1 server
$ $HOME/.asdf/installs/postgres/13.1/bin/pg_ctl \
    -D $HOME/.asdf/installs/postgres/13.1/data \
    start
```

This uses the specific asdf-versioned `pg_ctl` command to stop and start the
servers.

I've found it tedious to dig up these commands each time I need to switch, so I
added a [`switch_pg` function to my `~/.zshrc`
config](https://gist.github.com/jbranchaud/3cda6be6e1dc69c6f55435a387018dac).
