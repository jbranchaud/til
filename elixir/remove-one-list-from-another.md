# Remove One List From Another

The `--/2` operator allows you to subtract two lists, that is, remove all
elements in the _right_ list from the _left_ list. Each occurrence of an
element is removed if there is a corresponding element. If there is no
corresponding element, it is ignored.

Here are some examples.

```elixir
> [1, 2, 3] -- [2, 4]
[1, 3]
> [:a, :b, :c, :a, :d, :a] -- [:a, :a]
[:b, :c, :d, :a]
```

This kind of list operation is not particularly efficient, so for large
lists it can be quite slow. The following example took several minutes to
run.

```elixir
> Enum.into(1..1000000, []) -- Enum.into(2..1000000, [])
[1]
```

To achieve a true set difference, you'll note that the docs for this
operator recommend checking out `MapSet.difference/2`.

See `h Kernel.--` for more details.
