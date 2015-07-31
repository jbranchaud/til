# Double Splat To Merge Hashes

One way of merging two hashes is with `#merge`:

```ruby
> h1 = {a: 1, b: 2}
=> {:a=>1, :b=>2}
> h2 = {c: 3, d: 4}
=> {:c=>3, :d=>4}
> h1.merge(h2)
=> {:a=>1, :b=>2, :c=>3, :d=>4}
```

You can also use double splats for a slightly more concise approach:

```ruby
> h1 = {a: 1, b: 2}
=> {:a=>1, :b=>2}
> h2 = {c: 3, d: 4}
=> {:c=>3, :d=>4}
> {**h1, **h2}
=> {:a=>1, :b=>2, :c=>3, :d=>4}
```

This works particularly well when you want to expand an existing hash into a
hash you are creating on the fly:

```ruby
> h1 = {a: 1, b: 2}
=> {:a=>1, :b=>2}
> {c: 3, d: 4, **h1}
=> {:c=>3, :d=>4, :a=>1, :b=>2}
```
