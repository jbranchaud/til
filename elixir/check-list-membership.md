# Check List Membership

You can use the [`in` operator](https://hexdocs.pm/elixir/operators.html) to
check if something appears in a list. This is a handy way of checking if a
variable is one of a few acceptable or expected values.

For instance, a common DateTime comparison pattern relies on this to check
if a DateTime is `>=` or `<=` to another DateTime.

```elixir
{:ok, datetime} = DateTime.from_naive(~N[2016-05-24 13:26:08.003], "Etc/UTC")

DateTime.compare(datetime, DateTime.utc_now()) in [:lt, :eq]
```

Alternatively, you can check that something does not have membership in a
list by also including the `not` operator.

```elixir
DateTime.compare(datetime, DateTime.utc_now()) not in [:lt, :eq]
```
