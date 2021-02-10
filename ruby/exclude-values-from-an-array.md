# Exclude Values From An Array

In true Ruby fashion, there are all sorts of ways to exclude values from an
array.

If you just want to exclude `nil` values, you can use
[`#compact`](https://ruby-doc.org/core-3.0.0/Array.html#method-i-compact).

```ruby
> [1,nil,:what,4].compact
#=> [1, :what, 4]
```

If you want to exclude `nil` values and some other named value, you could use
[`#filter`](https://ruby-doc.org/core-3.0.0/Array.html#method-i-filter) or
[`#reject`](https://ruby-doc.org/core-3.0.0/Array.html#method-i-reject).

```ruby
> [1,nil,:what,4].filter { |val| !val.nil? && val != :what }
#=> [1, 4]
> [1,nil,:what,4].reject { |val| val.nil? || val == :what }
#=> [1, 4]
```

The filter is clumsy and heavy-handed for this sort of example. A really terse
way of doing the same thing is with set difference:
[`#-`](https://ruby-doc.org/core-3.0.0/Array.html#method-i-2D).

```ruby
> [1,nil,:what,nil,5] - [:what,nil]
#=> [1, 5]
```

Or the spelled out
[`#difference`](https://ruby-doc.org/core-3.0.0/Array.html#method-i-difference)
method.

```ruby
> [1,nil,:what,nil,5].difference([:what,nil])
#=> [1, 5]
```
