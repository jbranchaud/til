# Load And Use Env Var In Node Script

The node scripts defined under `scripts` in a `package.json` file can be used
to do all sorts of handy development tasks for a project.

There are times where those scripts would be even more useful if they had
access to environment variables specified in the project's `.env` files.

With the help of [`dotenv-cli`](https://github.com/venthur/dotenv-cli) and
[`cross-var`](https://github.com/elijahmanor/cross-var), we can load in and
reference the project's env vars.

As an example, let's say our `.env` file has a `DATABASE_URL`:

```
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/postgres"
```

We can create a node script in `package.json` that accesses that value like so:

```json
{
  "scripts": {
    "db:url": "dotenv cross-var -- echo \"%DATABASE_URL%\""
  }
}
```

Running that command will echo out the value:

```bash
❯ npm run db:url

> db:url
> dotenv cross-var -- echo "%DATABASE_URL%"

postgresql://postgres:postgres@localhost:9876/postgres
```

You could do something more useful with that value like open a `psql`
connection to that local database.

[source](https://www.genui.com/resources/env-variables-json)
