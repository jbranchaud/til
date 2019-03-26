# Passing Around And Using Modules

A module is a bag of functions. When we define a module, we are tying it to
an atom. If we pass around the atom that references this module, then we can
use it to call its functions.

For example, consider two types of greetings:

```elixir
defmodule Hello do
  def get_greeting do
    "Hello, World!"
  end
end

defmodule Hola do
  def get_greeting do
    "Hola, Mundo!"
  end
end
```

And a generic greeting module that accepts a language module:

```elixir
defmodule Greeting do
  def say_hello(language_module) do
    language_module.get_greeting
    |> IO.puts
  end
end

Greeting.say_hello(Hello) # => "Hello, World!"
Greeting.say_hello(Hola) # => "Hola, Mundo!"
```

The module reference that we pass in to `Greeting.say_hello` can be used to
invoke the `get_greeting` function.
