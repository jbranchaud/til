# Skip A Specific Test

Elixir's `ExUnit` supports all kinds of tags for customizing the behavior of
your test suite. The `:skip` tag signals that `ExUnit` should skip over that
specific test.

```elixir
@tag :skip
test "this is a test that should not run" do
  assert false
end
```

When you run `mix test`, it will make sure to not execute any tests with the
`:skip` tag.

Using the `:skip` tag can be a great temporary measure in a lot of
situations. It is not a good long-term practice to keep these around and
check them in.
