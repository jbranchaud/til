# Run The Development Server From Another Port

By default the [remix](https://remix.run/) development server runs on port
`3000`. There are two ways that you can specify a different port using an
environment variable.

First, you can specify the port from the command line when starting up the
server.

```bash
$ PORT=4444 npm run dev
```

Second, you can include the `PORT` environment variable in your `.env` file so
that you don't have to remember to include it from the CLI each time. Add the
following line to your `.env` file for that.

```
PORT=4444
```

Run `npm run dev` and you'll see the server start up at `localhost:4444`.
