# Reversing A List - Part 2

In [Reversing A List](reversing-a-list.md), I showed how Erlang's
`:lists.reverse()` function could be used to reverse a list. Since then,
Elixir now has a built-in function for reversing lists. In fact, it works
with anything that implements the `Enumerable` protocol.

```elixir
> Enum.reverse([1,2,3,4,5])
[5, 4, 3, 2, 1]
> Enum.reverse(%{a: 1, b: 2, c: 3})
[c: 3, b: 2, a: 1]
```
