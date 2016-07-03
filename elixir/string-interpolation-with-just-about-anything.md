# String Interpolation With Just About Anything

Coming to Elixir from Ruby, I am used to being able to interpolate literally
_anything_ into a string. In Elixir, this is not the case.

> By default, it handles strings, atoms (including nil, true, false and
> module name aliases like String – which are all just atoms behind the
> scenes), integers, floats, and some lists. That's it.

There are two approaches you can take to interpolate everything else into a
string. The easier approach is to use
[`Kernel.inspect/2`](http://elixir-lang.org/docs/stable/elixir/Kernel.html#inspect/2).

```elixir
> IO.puts "A map #{inspect %{a: 1, b: 2}}"
A map %{a: 1, b: 2}
```

The other approach is to implement the `String.Chars` protocol for the thing
that you are trying to print. You can read more about that in [_Elixir
String Interpolation for
Rubyists_](http://thepugautomatic.com/2016/01/elixir-string-interpolation-for-the-rubyist/).
