# Map With Index Over An Array

The [`#map`](https://devdocs.io/ruby~2.5/enumerable#method-i-map) method on its
own allows you to interact with each item of an array, producing a new array.

```ruby
[1,2,3].map { |item| item * item }
#=> [1,4,9]
```

If you also want access to the index of the item, you'll need some help from
other enumerable methods. As of Ruby 1.9.3, you can chain on
[`#with_index`](https://devdocs.io/ruby~2.5/enumerator#method-i-with_index):

```ruby
[1,2,3].map.with_index { |item, index| item * index }
#=> [0,2,6]
```

This method has the added benefit of allowing you to specify the starting value
of the index. It normally starts with `0`, but you could just as easily start
at `1`:

```ruby
[1,2,3].map.with_index(1) { |item, index| item * index }
#=> [1,4,9]
```

[source](https://stackoverflow.com/a/11280903/535590)
