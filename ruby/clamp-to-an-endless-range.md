# Clamp To An Endless Range

The
[`Comparable#clamp`](https://ruby-doc.org/3.3.6/Comparable.html#method-i-clamp)
method allows us to specify the bounds of a value we want. If the target value
is between the bounds, then we get that value. Otherwise, we gets the nearest
end of the bounds.

We can even pass a range to `#clamp` instead of separate lower and upper bound
values. Because Ruby has beginless and endless ranges, this gives us the
ergonomics to, say, clamp to any non-negative value with a `0..` endless range.

Here is what that looks like:

```ruby
> 22.clamp(0..)
=> 22
> (-33).clamp(0..)
=> 0
> 0.clamp(0..)
=> 0
```
