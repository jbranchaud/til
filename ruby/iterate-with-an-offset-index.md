# Iterate With An Offset Index

You can iterate over a collection of items with the
[`#each`](https://devdocs.io/ruby~2.5/enumerator#method-i-each) method. If you
want to know the index of each item as you go, you can use the
[`#each_with_index`](https://devdocs.io/ruby~2.5/enumerable#method-i-each_with_index)
variant.

```ruby
> ["one", "two", "three"].each_with_index do |item, index|
    puts "#{item} - #{index}"
  end
one - 0
two - 1
three - 2
=> ["one", "two", "three"]
```

The initial index will always be `0` when using `#each_with_index`.

What about if you want the index value to be offset by some number?

You can use the
[`#with_index`](https://devdocs.io/ruby~2.5/enumerator#method-i-with_index)
method on an _enumerator_. It optionally takes an `offset` argument.

```ruby
> ["one", "two", "three"].each.with_index(1) do |item, index|
    puts "#{item} - #{index}"
  end
one - 1
two - 2
three - 3
=> ["one", "two", "three"]
```
