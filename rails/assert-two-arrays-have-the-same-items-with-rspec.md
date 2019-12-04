# Assert Two Arrays Have The Same Items With RSpec

Methods that return arrays of values with inconsistent orderings can be
annoying to test with the `#eq` matcher. To keep your test from fickering,
you'd have to ensure the comparison is the same every time.

```ruby
it "has the correct values" do
  expect(fetch_colors(params).sort).to eq(["blue", "green", "yellow"])
end
```

It'd be better if we could keep our test focused and simple. If sort order
isn't something we care about, then it shouldn't be part of our test. RSpec has
a matcher for this kind of scenario --
[`#match_array`](https://www.rubydoc.info/github/rspec/rspec-expectations/RSpec%2FMatchers:match_array).

```ruby
it "has the correct values" do
  expect(fetch_colors(params)).to match_array(["blue", "green", "yellow"])
end
```

This allows us to ensure that each side of the comparison has the same set
values, irrespective of ordering.
