# Specifying The Server Port

Running `mix phx.server` for a Phoenix project with the default settings
will attach the server to port `4000`.

If you'd like to use a different port in development, you can change it in
`config/dev.exs`.

```elixir
config :my_app, MyApp.Web.Endpoint,
  http: [port: 4444],
  ...
```

Alternatively, you can allow it to be configurable from the command line
with an environment variable and a fallback port.

```elixir
config :my_app, MyApp.Web.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  ...
```

Running

```bash
$ PORT=4444 mix phx.server
```

will launch the server on port `4444`.
