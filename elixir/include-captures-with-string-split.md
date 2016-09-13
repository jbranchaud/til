# Include Captures With String.split

The
[`String.split/3`](http://elixir-lang.org/docs/stable/elixir/String.html#split/3)
function comes with two options: `trim` and `parts`. However, when using it
with a regex pattern, you gain access to a couple extra options, including
`include_captures`. This is because when used with a regex pattern,
`String.split` just invokes `Regex.split` which comes with extra options
like `include_captures`.

Here is `String.split` in action by itself and with the supported `trim`
option.

```elixir
> String.split("23d", ~r/\d+/)
["", "d"]
> String.split("23d", ~r/\d+/, trim: true)
["d"]
```

Adding in the `include_captures` option, we get a resulting list that
includes the value captured by the splitting regex.

```
> String.split("23d", ~r/\d+/, trim: true, include_captures: true)
["23", "d"]
```

This isn't a documented feature, so it is only supported as long as
`Regex.split` supports it and as long as `String.split` continues to
delegate to `Regex.split`.

h/t Chris Erin
