# Compute Intermediate Values In A With Construct

The expressions you use in a `with` construct do not have to contain the
`<-` syntax. You can pattern match and bind values along the way as well.

```elixir
with %{id: id} <- get_user(),
     url = "/api/#{id}/blogs",
     %{status_code: 200, body: body} <- HTTPoison.get(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
end
```

In the above (sorta contrived) example we were able to construct a URL in
the middle of the series of expressions.

The values we compute inline will be closed into the `with` construct, so
they won't leak.

See the [`with`
docs](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1) for more
details.
