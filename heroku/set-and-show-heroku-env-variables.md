# Set And Show Heroku Env Variables

The `heroku` CLI includes the `config` command which will show all the env
variables for the current app.

```bash
$ heroku config
=== my-app Config Vars

```

At this point I have none set.

I can set one with the `config:set` command and a key-value parameter.

```bash
$ heroku config:set PUBLIC_NEXT_URL=http://localhost:1235
Setting PUBLIC_NEXT_URL and restarting ⬢ my-app... done, v3
PUBLIC_NEXT_URL: http://localhost:1235
```

I can see the value that this specific variable is set to by calling it with
`config:get`.

```bash
$ heroku config:get PUBLIC_NEXT_URL
http://localhost:1235
```

[source](https://devcenter.heroku.com/articles/config-vars#using-the-heroku-cli)
