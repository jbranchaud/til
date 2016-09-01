# Do You Have The Time?

Elixir doesn't come with any standard ways of getting at or working with
time. There are packages like [Timex](https://github.com/bitwalker/timex)
out there that we can pull in to our projects. However, if we don't have
need for a full-featured date/time library, we can opt for a simpler
solution.

Erlang can give us the time.

```elixir
defmodule TickTock do
  def current_time do
    {hh,mm,ss} = :erlang.time
    "#{hh}:#{mm}:#{ss}"
  end
end

> TickTock.current_time
"11:47:13"
```
