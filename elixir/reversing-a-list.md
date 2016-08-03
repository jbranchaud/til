# Reversing A List

To efficiently work with and _transform_ lists in Elixir, you will likely
need utilize a list reversing function from time to time. Your best bet is
to reach for the Erlang implementation which is available as part of the
`lists` module.

Here are a couple examples of how to use it:

```elixir
> :lists.reverse([1,2,3])
[3, 2, 1]
> :lists.reverse([1, :a, true, "what", 5])
[5, "what", true, :a, 1]
```

Note: though I said "_transform_ lists" above, what is actually going on is
that a new version of the list representing my transformation is being
created, per Elixir's functional nature.
