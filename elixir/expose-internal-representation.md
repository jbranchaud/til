# Expose Internal Representation

Elixir is a language that has strong support for metaprogramming. It
provides easy access to an internal representation of the code in the form
of an Abstract Syntax Tree (AST) using maps and keyword lists. The `quote`
macro is used to expose this internal representation.

```elixir
> quote do: 2 * 2
{:*, [context: Elixir, import: Kernel], [2, 2]}
> quote do: 2 * 2 == 4
{:==, [context: Elixir, import: Kernel],
 [{:*, [context: Elixir, import: Kernel], [2, 2]}, 4]}
```

[source](http://elixir-lang.org/getting-started/meta/quote-and-unquote.html)
