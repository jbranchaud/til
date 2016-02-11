# Append To A Keyword List

If you have two keyword lists, you can append them like so:

```elixir
> a = [a: 1]
[a: 1]
> b = [b: 2]
[b: 2]
> a ++ b
[a: 1, b: 2]
```

But what if something a bit more programmatic is happening and you are
building up the additions to the keyword list based on variables?

```elixir
> x = :x
:x
> c = a ++ [x 5]
** (CompileError) iex:5: undefined function x/1
    (stdlib) lists.erl:1353: :lists.mapfoldl/3
    (stdlib) lists.erl:1354: :lists.mapfoldl/3
```

That makes elixir think `x` is some function when in fact it is just a
variable containing the keyword `:x`.

Simply adding a comma doesn't quite do it either.

```elixir
> c = a ++ [x, 5]
[{:a, 1}, :x, 5]
```

We need to wrap the internal part with curly braces to create the tuple that
can then be appended to `a`.

```elixir
> c = a ++ [{x, 5}]
[a: 1, x: 5]
```
