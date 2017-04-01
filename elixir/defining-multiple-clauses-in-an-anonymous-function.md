# Defining Multiple Clauses In An Anonymous Function

Anonymous functions often take the approach of doing a single thing with the
inputs, regardless of their shape or values. There is no need to limit
ourselves though. The same pattern matching that we use all over our Elixir
programs can be utilized to define multiple clauses in an anonymous function
as well.

Consider the following example:

```elixir
iex> my_function = fn
  {:ok, x} -> "Everything is ok: #{x}"
  {:error, x} -> "There was an error: #{x}"
end
#Function<6.52032458/1 in :erl_eval.expr/5>
```

We can then invoke our anonymous function using the bound variable to see
what results we get with different kinds of inputs.

```elixir
iex> my_function.({:ok, 123})
"Everything is ok: 123"
iex> my_function.({:error, "be warned"})
"There was an error: be warned"
```

[source](http://stackoverflow.com/a/18023790/535590)
