# Counting Records With Ecto

Sometimes you want to know how many records there are in a table. Ecto gives
us a couple ways to approach this.

We can use the
[`count\1`](https://hexdocs.pm/ecto/Ecto.Query.API.html#count/1) function
that the Ecto query API provides.

```elixir
> Repo.one(from p in "people", select: count(p.id))

16:09:52.759 [debug] QUERY OK source="people" db=1.6ms
SELECT count(p0."id") FROM "people" AS p0 []
168
```

Alternatively, we can use the
[`fragment/1`](https://hexdocs.pm/ecto/Ecto.Query.API.html#fragment/1)
function to use PostgreSQL's `count` function.

```elixir
> Repo.one(from p in "people", select: fragment("count(*)"))

16:11:19.818 [debug] QUERY OK source="people" db=1.5ms
SELECT count(*) FROM "people" AS p0 []
168
```

Lastly, `Ecto.Repo` has the
[`aggregate/4`](https://hexdocs.pm/ecto/Ecto.Repo.html#c:aggregate/4)
function which provides a `:count` option.

```elixir
> Repo.aggregate(from(p in "people"), :count, :id)

16:11:23.786 [debug] QUERY OK source="people" db=1.7ms
SELECT count(p0."id") FROM "people" AS p0 []
168
```
