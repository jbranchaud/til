# Creating A PID

Often times, when invoking a function that spawns a process, the PID of the
spawned process is returned and we bind to it. That PID is a reference to
some BEAM process in our system.

We can create our own references using the `pid/3` function.

Let's assume we have the following processes, among others, in our system at
the moment.

```elixir
> Process.list |> Enum.reverse |> Enum.take(3)
[#PID<0.284.0>, #PID<0.283.0>, #PID<0.282.0>]
```

We can create a reference to any of them using the three number parts that
they are made up of.

```elixir
> pid(0, 284, 0)
#PID<0.284.0>
```

See, it's alive.

```elixir
> pid(0, 284, 0) |> Process.alive?
true
```

What if we make up a PID that doesn't actually reference any process?

```elixir
> pid(0, 333, 0) |> Process.alive?
false
```

Note: there is also a `pid/1` version of the function. See `h pid` for more
details.
