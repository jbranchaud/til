# Wrap Things In An Array, Even Hashes

I've always used `Kernel::Array` to wrap things in an array. It works great.

```ruby
> Array(nil)
#=> []
> Array(1)
#=> [1]
> Array(["hello", "world"])
#=> ["hello", "world"]
```

Except with hashes, it might not do what you expect when given a hash.

```ruby
> Array({a: 1, b: 2})
#=> [[:a, 1], [:b, 2]]
```

I just wanted the hash wrapped in an array, not turned into an array of tuples.

The `Array` class has a method `#wrap` which behaves similarly to
`Kernal::Array` while also handling hashes in the way I was wanting.

```ruby
> Array.wrap(nil)
#=> []
> Array.wrap(1)
#=> [1]
> Array.wrap(["hello", "world"])
#=> ["hello", "world"]
> Array.wrap({a: 1, b: 2})
#=> [{a: 1, b: 2}]
```

[source](https://devdocs.io/rails~5.2/array#method-c-wrap)
