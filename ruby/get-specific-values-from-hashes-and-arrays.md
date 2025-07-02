# Get Specific Values From Hashes And Arrays

Ruby defines a `#values_at` method on both `Hash` and `Array` that can be used
to grab multiple values from an instance of either of those structures.

Here is an example of grabbing values by key (if they exist) from a hash.

```ruby
> hash = {one: :two, hello: "world", four: 4}
=> {one: :two, hello: "world", four: 4}
> hash.values_at(:one, :four, :three)
=> [:two, 4, nil]
```

And here is an example of grabbing values at specific indexes from an array, if
those indexes exist.

```ruby
> arr = [:a, :b, :c, :d, :e]
=> [:a, :b, :c, :d, :e]
> arr.values_at(0, 3, 6)
=> [:a, :d, nil]
```

Notice that in both cases, `nil` is returned for a key or index that doesn't
exist.

What I like about this method is that in a single call I can grab multiple
named (or indexed) values and get a single array result with those values.

One way I might use this with a JSON response from an API request could look
like this:

```ruby
resp = client.getSomeData(id: 123)

[status, body] = resp.values_at("status", "body")

if status == 200
  puts body
end
```

[source](https://docs.ruby-lang.org/en/3.4/Hash.html#method-i-values_at)
