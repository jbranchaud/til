# Fail

The `fail` method is synonymous with `raise` in Ruby. Consider the following
code snippet:

```ruby
def is_odd?(num)
  num.odd?
rescue
  fail StandardError, 'you cannot use odd on this'
end

> is_odd?(1)
#=> true
> is_odd?('hello')
#=> StandardError: you cannot use odd on this
```

Nevertheless, I believe the `raise` method is preferred to the `fail`
method.

[source](http://ruby-doc.org/core-2.3.0/Kernel.html#method-i-fail)

h/t Dorian Karter
