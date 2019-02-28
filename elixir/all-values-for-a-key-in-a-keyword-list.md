# All Values For A Key In A Keyword List

A keyword list in Elixir can contain the same key multiple times.

```elixir
kwl = [a: 1, b: 2, a: 3, c: 4]
#=> [a: 1, b: 2, a: 3, c: 4]
```

The `get/2` function will only grab the value of the first occurrence.

```elixir
Keyword.get(kwl, :a)
#=> 1
```

You can use `get_values/2` to retrieve _all_ values associated with the key.

```elixir
Keyword.get_values(kwl, :a)
#=> [1, 3]
```
