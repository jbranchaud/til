# Requiring Keys For Structs

When defining a
[`struct`](http://elixir-lang.org/getting-started/structs.html) in Elixir,
we may want to ensure that certain values are provided. We can require that
certain keys are used in the creation of a struct with the
[`@enforce_keys`](https://hexdocs.pm/elixir/Kernel.html#defstruct/1)
attribute. Here is an example of a `Name` struct.

```elixir
defmodule Name do
  @enforce_keys [:first, :last]
  defstruct [:first, :middle, :last]
end
```

With this defined, we can create a struct that uses all of the keys.

```elixir
> jack = %Name{first: "Jack", middle: "Francis", last: "Donaghy"}
%Name{first: "Jack", last: "Donaghy", middle: "Francis"}
```

We can also ignore `:middle` and just provide the required keys.

```elixir
> liz = %Name{first: "Liz", last: "Lemon"}
%Name{first: "Liz", last: "Lemon", middle: nil}
```

We cannot, however, omit any of the keys specified in `@enforce_keys`. If we
do omit any of them, Elixir will raise an error.

``` elixir
> tracy = %Name{first: "Tracy"}
** (ArgumentError) the following keys must also be given when building struct Name: [:last]
    expanding struct: Name.__struct__/1
    iex:6: (file)
```
