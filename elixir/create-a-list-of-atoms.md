# Create A List Of Atoms

The `~w` sigil makes it easy to create a word list -- a list of strings --
where each word is separated by a space.

```elixir
> ~w(bulbasaur charmander squirtle)
["bulbasaur", "charmander", "squirtle"]
```

By appending an `a` onto that sigil construct, you are instructing Elixir
that you would instead like a list of atoms.

```elixir
> ~w(bulbasaur charmander squirtle)a
[:bulbasaur, :charmander, :squirtle]
```

[source](http://elixir-lang.org/getting-started/sigils.html#strings)
