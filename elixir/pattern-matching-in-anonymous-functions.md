# Pattern Matching In Anonymous Functions

Pattern matching shows up everywhere in Elixir, even where you may not be
expecting it. When declaring an anonymous function, you can use pattern
matching against different sets and shapes of input parameters to invoke
different behaviors.

Here is an example of how you might use this:

```elixir
> handle_result = fn
  {:ok, result} -> IO.puts "The result is #{result}"
  :error -> IO.puts "Error: couldn't find anything"
end
#Function<6.50752066/1 in :erl_eval.expr/5>

> Map.fetch(%{a: 1}, :a) |> handle_result.()
The result is 1
:ok
> Map.fetch(%{a: 1}, :b) |> handle_result.()
Error: couldn't find anything
:ok
```

[source](https://elixirschool.com/lessons/basics/functions#pattern-matching)
