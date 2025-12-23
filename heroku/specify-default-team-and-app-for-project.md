# Specify Default Team And App For Project

Typically when you run commands with the Heroku CLI you'll need to specify the
name of the app on Heroku you're targeting with the `--app` flag. However, to
first see the names of the apps you may want to run `heroku apps` (or `heroku
list`). That will list the apps for your default team.

If you need to see apps for a different team (i.e. organization), you'll need to
specify that team either with the `--team` flag or by setting that as an
environment variable.

Here I do the latter in an `.envrc` file:

```
# Heroku
export HEROKU_ORGANIZATION=visualmode
```

Once that is set and the environment reloaded, running `heroku apps` will show
the apps specific to that team on Heroku.

Similarly, if you want to set a default app for your project so that you don't
have to always specify the `--app` flag, you can update your `.envrc`
accordingly.

```
# Heroku
export HEROKU_ORGANIZATION=visualmode
export HEROKU_APP=my-app
```

I had a hard time finding official documentation for this which is why I'm
writing this up here. I've manually verified this works with my own team and
app.
