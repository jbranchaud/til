# Do You Have The Time? - Part 2

In [_Do You Have The
Time?_](https://github.com/jbranchaud/til/blob/master/elixir/do-you-have-the-time.md),
I demonstrated a way of using an Erlang function to get at and work with
time in Elixir. As of Elixir 1.3, there is now a [`Time`
module](http://elixir-lang.org/docs/stable/elixir/Time.html) that provides a
sigil and some functions for working with time.

We can use Elixir's `Time` module to simplify the example from the previous
iteration of this TIL:

```elixir
defmodule TickTock do
  def current_time do
    Time.from_erl!(:erlang.time)
    |> Time.to_string
  end
end

> TickTock.current_time
"19:58:12"
```
