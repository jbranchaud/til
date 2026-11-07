# Set Env Var With Dokku Without A Restart

I'm about to deploy a feature to production via [Dokku](https://dokku.com/).
That feature relies on a couple new env vars being set in that environment. I
want to make sure those are set before I deploy so that the updates to the web
app can read them right away.

Typically to set or update an env var via `dokku`, I'd run a command like this
via ssh:

```bash
ssh my-app-prod 'dokku config:set my-app INTERCOM_APP_ID=abc123'
```

When I run the above command, it will trigger an app restart so that the new env
var is picked up.

In my case, what I would prefer to do is set a couple env vars without
triggering the restart and then follow that with a production deploy which will
then pick up the updated environment.

I can do that with the `--no-restart` flag.

```bash
ssh my-app-prod 'dokku config:set --no-restart my-app INTERCOM_APP_ID=abc123 OTHER_FEATURE_ENV=taco'
```

[source](https://dokku.com/docs/configuration/environment-variables/)
