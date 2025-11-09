# Reference Hash Key With Safe Navigation

Let's say we have a variable that we expect to be a hash, but could also be
`nil`. We want to try to grab a value from that hash by referencing a specific
key. Because it could be `nil`, we cannot simply do:

```ruby
stuff[:key]
```

As that could result in `NoMethodError: undefined method '[]' for nil
(NoMethodError)`.

We should use the _safe navigation_ operator (`&`) to avoid raising that error.
However, we should pay attention to a necessary syntax shift from the short-hand
`[:key]` to the long-hand `[](:key)`.

```ruby
stuff&.[](:key)
```

The meaning of this syntax is that we are calling the `#[]` method and we pass
it a single argument `:key` wrapped in parentheses.

Another approach would be to use `#dig` which can feel more ergonomic than the
above syntax switch.

```ruby
stuff&.dig(:key)
```
