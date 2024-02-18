# Manage Major Versions With Brew and Direnv

I can install multiple major versions of PostgreSQL to my machine with `brew`
with commands like the following:

```bash
$ brew install postgresql@14
$ brew install postgresql@16
$ # ...
```

I can then start and stop specific Postgres server versions using the `brew
services start/stop` commands. Let's say 14 is running, but I want to switch to 16.

```bash
$ brew services stop postgresql@14
$ brew services start postgresql@16
```

Then I can use [`direnv`](https://direnv.net/) to manage the Postgres client
(bin directory) that gets used for certain projects. This way when I run a
command like `pg_dump` or `psql` it will use the one associated with a specific
major version of Postgres.

Assuming I already have `direnv` installed, I can add a `.envrc` to my project
with the following line:

```
PATH_add /usr/local/opt/postgresql@16/bin
```

And then tell my system that the changes to this file are allowed to be sourced
by `direnv`:

```bash
$ direnv allow .
```

That's it. Now I have PostgreSQL 16 (client and server) ready to use for my
current project.
