# Using When Clauses In A With Construct

Because Elixir's `with` construct supports the full power of the language's
pattern matching, we can use `when` clauses to further narrow down our
matches.

For instance, if we want to match against the response to an API request,
but only for response status codes in the 2xx range, we can do something
like the following:

```elixir
with %{status_code: code, body: body}
       when code >= 200 && code < 300 <- HTTPoison.get!(url),
     {:ok, decoded_body} <- Poison.decode(body) do
  {:ok, decoded_body}
end
```

See the [docs for
`with`](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1) for more
details.
