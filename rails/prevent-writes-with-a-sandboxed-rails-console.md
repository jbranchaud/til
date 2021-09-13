# Prevent Writes With A Sandboxed Rails Console

I often open a `rails console` to play around with some data and make sure I
understand how some models can be instantiated while respecting their
associations. There are plenty of times where I've created some data in the
`development` database that doesn't need to be there. It may even be incomplete
data from a failed experiment.

This data accumlates and clutters up the database.

One way to avoid this is by running the console in a sandboxed mode. Include
the `--sandbox` flag when starting up a session to do this.

```bash
$ rails console --sandbox
Loading development environment in sandbox (Rails 5.2.6)
Any modifications you make will be rolled back on exit
[1] pry(main)>
```

This wraps the session in a transaction so that any writes to the database can
be rolledback afterward.

[source](https://dev.to/citizen428/rails-quick-tips-1-console-sandbox-4k0c)
