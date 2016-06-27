# Word Lists For Atoms

The `~w` sigil works similarly to Ruby's `%w` (word array notation). It
allows you to create a list of words (i.e. strings).

```elixir
> ~w(one two three)
["one", "two", "three"]
```

It sets itself apart though with some modifiers. The default behavior
matches the `s` modifier (for strings).

```elixir
> ~w(one two three)s
["one", "two", "three"]
```

Where it gets more interesting is with the `a` modifier allowing you to
create a list of atoms.

```elixir
> ~w(one two three)a
[:one, :two, :three]
```

Note: there is a third modifier, `c`, for char lists.

```elixir
> ~w(one two three)c
['one', 'two', 'three']
```

[source](http://elixir-lang.org/getting-started/sigils.html)
