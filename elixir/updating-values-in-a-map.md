# Updating Values In A Map

When working with maps in any language, you often need a way to update
key-value pairs. Furthermore, you will need a way to handle keys that are
not already present in the map, generally associating some default value.

In Elixir, the `Map` module provides the `get_and_update/3` function as a
way of accomplishing such a task.

You need to provide the map, the key to be fetched and updated, and a
function for _transforming_ (or updating) the existing value.

Let's use a score counting example to see it in action:

```elixir
> scores = %{}
%{}
# jake scores a point
> {_, scores} = Map.get_and_update(scores, :jake, fn(x) -> {x, (x || 0) + 1} end)
{nil, %{jake: 1}}
# chris scores a point
> {_, scores} = Map.get_and_update(scores, :chris, fn(x) -> {x, (x || 0) + 1} end)
{nil, %{chris: 1, jake: 1}}
# jake scores another point
> {_, scores} = Map.get_and_update(scores, :jake, fn(x) -> {x, (x || 0) + 1} end)
{1, %{chris: 1, jake: 2}}
# final scores
> scores
%{chris: 1, jake: 2}
```

We use `(x || 0) + 1` as the updated value. This is a simple way of
providing a default value for when the key is not already present in the
map.

The update function is expected to return a tuple with the _original_ value
and the _updated_ value.

See [the
docs](http://elixir-lang.org/docs/stable/elixir/Map.html#get_and_update/3)
for more details.
