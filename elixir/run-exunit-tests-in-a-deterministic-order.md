# Run ExUnit Tests In A Deterministic Order

When running a file of
[`ExUnit`](http://elixir-lang.org/docs/stable/ex_unit/ExUnit.html) tests,
they will be executed in a pseudo-random order based on a seed value. In
general, `ExUnit` will pick a random seed each time you run your tests. If
you'd like to add some determinism to the order that your tests run in, you
can specify the seed in the `ExUnit` configuration.

```elixir
ExUnit.configure seed: 42
ExUnit.start

defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "the truth" do
    assert true
  end

  test "more truth" do
    assert 2 + 2 = 4
  end
end
```

[source](https://til.hashrocket.com/posts/4a7dc5fd94-run-exunit-tests-in-the-order-they-are-defined)

h/t Chris Erin
