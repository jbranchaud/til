# Set, Get, And Unset Env Vars With Dokku

The `dokku` CLI provides `config` subcommands for managing environment variables
for the target container.

An env var can be set for an active container with `config:set`:

```bash
$ dokku config:set app-name JEMALLOC_ENABLED=true MALLOC_CONF="stats_print:true"
```

Notice I'm able to set multiple env vars at once if needed.

If I ever need to check what an env var is currently set to for one of my app
containers, I can use `config:get`:

```bash
$ dokku config:get app-name JEMALLOC_ENABLED
true
```

I can always override any value with another `config:set`. However, if I need to
entirely remove the env var, I can use `config:unset`:

```bash
$ dokku config:unset app-name MALLOC_CONF
```

[source](https://dokku.com/docs/configuration/environment-variables/)
