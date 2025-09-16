# Avoid Double Negation With Minitest Refute

As I'm writing some tests for a recent feature, I end up with various test
cases that make a variety of assertions.

```ruby
assert_equal resp_body["id"], expected_id

# ...

assert_not resp_body["items"].empty?
```

The first assertion reads pretty naturally. The second one requires some extra
mental parsing because of the `_not` and then the "negative" check of
`#empty?`.

Another way to express this that might read more naturally is with
[`#refute`](https://ruby-doc.org/stdlib-3.0.2/libdoc/minitest/rdoc/Minitest/Assertions.html#method-i-refute).

```ruby
refute resp_body["items"].empty?
```

This says that we _refute_ that items is empty, so the assertion should fail if
empty.

Ruby is flexible in other ways. We may also prefer to write it as:

```ruby
assert resp_body["items"].present?
```

Or we could even take advantage of a more specific variant of refute with
[`#refute_empty`](https://ruby-doc.org/stdlib-3.0.2/libdoc/minitest/rdoc/Minitest/Assertions.html#method-i-refute_empty):

```ruby
refute_empty resp_body["items"]
```
