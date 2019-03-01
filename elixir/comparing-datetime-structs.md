# Comparing DateTime Structs

> Remember, comparisons in Elixir using ==/2, >/2, </2 and friends are
> structural and based on the DateTime struct fields. For proper comparison
> between datetimes, use the compare/2 function.

As the [DateTime docs](https://hexdocs.pm/elixir/DateTime.html) say, you'll
want to use [`compare/2`](https://hexdocs.pm/elixir/DateTime.html#compare/2)
in order to accurately compare two `DateTime` structs.

```elixir
{:ok, older} = DateTime.from_naive(~N[2016-05-24 13:26:08.003], "Etc/UTC")
{:ok, newer} = DateTime.from_naive(~N[2017-11-24 13:26:08.003], "Etc/UTC")

DateTime.compare(older, newer)
#=> :lt

DateTime.compare(newer, older)
#=> :gt

DateTime.compare(newer, newer)
#=> :eq
```

When using `compare/2`, you'll get one of `:lt`, `:gt`, or `:eq` as a
result, meaning _less than_, _greater than_, or _equal_ respectively.
