# Pass A Block To Count

Ruby's [`Enumerable`](http://ruby-doc.org/core-2.2.3/Enumerable.html) module
comes with the method `#count` for determining how many items are in an
array or hash.

```ruby
> [1,2,3].count
=> 3
> {a: 1, b: 2}.count
=> 2
```

The `#count` method has a trick up its sleeve though. It can take a block
with a predicate that returns `true` or `false`. It essentially acts like
`#select` returning the count rather than the array subset itself.

```ruby
> [1,2,3].count { |x| x.odd? }
=> 2
> {a: 1, b: 2}.count { |(x,y)| y < 0 }
=> 0
```
