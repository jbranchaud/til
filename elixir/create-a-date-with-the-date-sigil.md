# Create A Date With The Date Sigil

Elixir 1.3 introduced a new sigil for creating dates, `~D`. It works in the
same way as Date's
[`new/3`](http://elixir-lang.org/docs/stable/elixir/Date.html#new/3)
function producing the Date struct with each of the date parts.

```elixir
> ~D[2016-01-01]
~D[2016-01-01]
> ~D[2016-01-01].year
2016
> ~D[2016-01-01].month
1
> ~D[2016-01-01].day
1
```
