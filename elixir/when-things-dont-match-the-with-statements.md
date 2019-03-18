# When Things Don't Match The With Statements

You set up a series of match statements in a `with` construct as a way of
avoiding a bunch of nested if statements. Inevitably you will be passing
data through that doesn't meet all of the match criteria. By default, the
`with` construct will short circuit and your program will continue from
there.

You can, however, take more control over how you handle the _failure_ cases
by employing an `else` block. The `else` block works a lot like a case
statement.

```elixir
with %{status_code: 200, body: body} <- HTTPoison.get!(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
else
  %{status_code: 401} ->
    reauthenticate()
  _ ->
    log_error()
end
```

Here we are able to anticipate a _failure_ case and respond accordingly. For
everything else, we have a generic action that we take.

See the [docs for
`with`](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1) for more
details.
