# Assert An Exception Is Raised

Elixir's [`ExUnit`](http://elixir-lang.org/docs.html) comes with a number of
different ways to make assertions in your tests. One of those functions is
[`assert_raise`](http://elixir-lang.org/docs/stable/ex_unit/ExUnit.Assertions.html#assert_raise/2)
which allows you to test that a particular exception is raised when the
given function is invoked.

Using `assert_raise/2` looks something like this:

```elixir
assert_raise FunctionClauseError, fn ->
  Enum.chunk([1,2,3], 0)
end
```

The `assert_raise/3` form is also available which allows you to test both
the type of exception and the resulting message.

```elixir
assert_raise FunctionClauseError, ~r/^no function clause matching/, fn ->
  Enum.chunk([1,2,3], 0)
end
```

Using the regex sigil for the second argument is generally a good way to go
to keep tests from getting too brittle.
