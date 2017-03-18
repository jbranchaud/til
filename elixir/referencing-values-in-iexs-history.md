# Referencing Values In IEx's History

Each time we execute a statement in an `iex` session, the counter is
incremented. These numbers are references to the history of the session. We
can use these references to _refer_ to previously executed values using
`v/1`. This is particularly handy for multi-line statements or when we
forget to bind to the result of some function.

Consider the following `iex` session:

```elixir
iex(1)> :one
:one
iex(2)> 1 + 1
2
iex(3)> "three" |> String.to_atom()
:three
```

If we execute `v()` on its own, it is the same as `v(-1)` in that it will
give us the latest value in the history.

```elixir
iex(4)> v()
:three
```

Providing any positive number will refer to the references we see next to
each statement.

```elixir
iex(5)> v(1)
:one
```

Negative numbers, as we saw with `v(-1)`, will count backwards in the
history from where we are.

```elixir
iex(6)> v(-4)
2
```

See `h v` for more details.
