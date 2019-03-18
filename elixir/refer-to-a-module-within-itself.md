# Refer To A Module Within Itself

Elixir comes with the `__MODULE__` reserve word for referencing a module
within itself. This is handy for things like structs.

```elixir
defmodule SomeNamespace.MyModule do
  defstruct [:id]

  def do_thing(%__MODULE__{}=thing) do
    # ...
  end
end
```

You can use an alias in order to ditch `__MODULE__` and perhaps make your
code a bit more human readable.

```elixir
defmodule SomeNamespace.MyModule do
  alias __MODULE__, as: MyModule

  defstruct [:id]

  def do_thing(%MyModule{}=thing) do
    # ...
  end
end
```
