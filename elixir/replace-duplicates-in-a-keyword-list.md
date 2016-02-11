# Replace Duplicates In A Keyword List

Use the
[`Keyword.put`](http://elixir-lang.org/docs/stable/elixir/Keyword.html#put/3)
function to replace duplicate key entries in a keyword list.

If there are no duplicate entries, the entry will just be added.

```elixir
Keyword.put([a: 1], :b, 2)
[b: 2, a: 1]
```

If there is a duplicate entry, it will be replaced by the new value.

```elixir
> Keyword.put([b: 1, a: 1], :b, 2)
[b: 2, a: 1]
```

If there are multiple duplicate entries, they will all be replaced.

```elixir
> Keyword.put([b: 3, b: 4, a: 1], :b, 2)
[b: 2, a: 1]
```
