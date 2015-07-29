# Passing Arbitrary Methods As Blocks

Use
[`Object#method`](http://ruby-doc.org/core-1.8.7/Object.html#method-i-method)
to create a callable `Method` object that can be passed to methods
that yield to a block.

```ruby
def inc(x)
  x + 1
end

[1,2,3].map(&method(:inc))
#=> [2,3,4]
```
