# Listing Files In IEx

When you start an IEx session, you do so in the context of some directory --
the current working directory. This context can be important if you need to
do something like import a file. In fact, you may want to know what files
are available in the current working directory.

You can list them all out within IEx using `ls/0`.

```elixir
iex(1)> ls()
           .git     .gitignore      README.md         _build         assets         config
           deps            lib        mix.exs       mix.lock           priv           test
            tmp
```

You can also list the contents of some other specific directory by naming it
when invoking `ls/1`.

See `h()` within IEx for more details.
