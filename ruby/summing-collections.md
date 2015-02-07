# Summing Collections

Given a hash, `my_hash`,

```ruby
my_hash = {
    "one" => 1,
    "two" => 2,
    "three" => 5
}
```

I want to determine the sum of the values in `my_hash`, which should be `8`.

This is similar to asking for the sum of the values in an array. In fact,
using `#values` on `my_hash` will leave us with the task of summing the
values in an array.

It turns out that to sum the values in an array, all you need is `#inject`

```ruby
[1,2,5].inject(:+)
=> 8
```

So, if I want the sum of the values in a hash, such as `my_hash`, then all
that is needed is

```ruby
my_hash.values.inject(:+)
=> 8
```

To take this one step further, let's consider what will happen with an empty
array. The above approach will produce `nil`. If we want `0` when the list
is empty, then tell `#inject` to do just that

```ruby
[].inject(0, :+)
=> 0
```

[source](http://stackoverflow.com/questions/1538789/how-to-sum-array-of-numbers-in-ruby)
