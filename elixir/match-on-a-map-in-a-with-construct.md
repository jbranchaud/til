# Match On A Map In A With Construct

Many usage example of the
[`with`](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1)
construct show a series of matches on a tuple.

```elixir
with {:ok, width} <- Map.fetch(opts, :width),
     {:ok, height} <- Map.fetch(opts, :height) do
  {:ok, width * height}
end
```

You can match on more than just tuples though. Here is how you might match
on a map.

```elixir
with %{status_code: 200, body: body} <- HTTPoison.get!(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
end
```

In fact, you have the full power of Elixir's pattern matching available to
you in your series of matches for a `with` construct.
