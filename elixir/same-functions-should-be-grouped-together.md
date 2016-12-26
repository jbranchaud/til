# Same Functions Should Be Grouped Together

A favorite feature of Elixir is the function clauses that can be defined in
multiple ways with pattern matching. I've always grouped same-named function
clauses together. It seems like good form and it's what I see everyone else
doing. It also makes for readable, maintainable code.

This is more than just personal preference though. It is the correct,
idiomatic way to organize your Elixir function clauses. The compiler will
let you know if anything gets out of place.

Consider the following snippet of code:

```elixir
defmodule MeterToLengthConverter do
  def convert(:feet, m), do: m * 3.28084
  def convert(:inch, m), do: m * 39.3701
  def hello(), do: IO.puts "Hello, World!"
  def convert(:yard, m), do: m * 1.09361
end
```

It is syntactically correct, so it will compile. However, the compiler will
emit a warning like the following:

```
warning: clauses for the same def should be grouped together, def convert/2
was previously defined (length_converter.ex:2)
  length_converter.ex:5
```
