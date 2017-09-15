# Serve Static Assets From Custom Directory

When you new up a Phoenix project, an `endpoint.ex` file will be generated.
This file is full of different plugs for handling incoming traffic. The
`Plug.Static` declaration specifies how your application will handle and
serve requests for static files.

```elixir
  plug Plug.Static,
    at: "/", from: :my_app, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
```

The `from` options declares where these static files are located. In this
case it references our application (`:my_app`) as the target which will
translate to its `priv/static` directory.

If you instead want to serve your files from a different, custom directory,
you can replace it with the path to that directory.

```elixir
  plug Plug.Static,
    at: "/", from: "priv/my_frontend/static", gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)
```

[source](https://hexdocs.pm/plug/Plug.Static.html)
