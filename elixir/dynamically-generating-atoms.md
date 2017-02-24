# Dynamically Generating Atoms

> Atoms are constants where their name is their own value.

The use of atoms like `:ok` and `:error` show up all over the place in
Elixir. These are atoms that tend to be statically defined. Atoms can also
be dynamically defined using string interpolation.

For example, I can generate a handful of atoms by mapping over a range of
integers.

```elixir
> Enum.map(1..5, &(:"some_atom_#{&1}"))
[:some_atom_1, :some_atom_2, :some_atom_3, :some_atom_4, :some_atom_5]
```
