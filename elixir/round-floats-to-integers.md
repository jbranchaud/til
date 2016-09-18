# Round Floats To Integers

The
[`Float.round/2`](http://elixir-lang.org/docs/stable/elixir/Float.html#round/2)
function allows you to round floating point numbers. The result is another
floating point number.

```elixir
> Float.round(1.5)
2.0
> Float.round(1.3)
1.0
```

If, instead, you always want an integer as the result of rounding, you can
use `Kernel`'s version of a rounding function:

```elixir
> Kernel.round(1.5)
2
> Kernel.round(1.3)
1
```

The
[`Kernel.round/1`](http://elixir-lang.org/docs/stable/elixir/Kernel.html#round/1)
function accepts both integers and floats, and always returns an integer.
Additionally, it can be used in guard tests.
