# Enumerate A Pairing Of Every Two Sequential Items

From time to time, I've come across a situation where I want to iterate over a
list of items and have access to the item right after (or before depending on
how you want to think about it) the current item.

If I had a list like:

```ruby
items = [:a, :b, :c, :d, :z]
```

Then I'd love to turn it into a list of tuples like so:

```ruby
tuples = [[:a, :b], [:b, :c], [:c, :d], [:d, :z]]
```

I've finally come up with a one-liner I like for turning `items` into `tuples`.

```ruby
items.first(items.size - 1)
# => [:a, :b, :c, :d]
items.last(items.size - 1)
#=> [:b, :c, :d, :z]
items.first(items.size - 1).zip(items.last(items.size - 1))
#=> [[:a, :b], [:b, :c], [:c, :d], [:d, :z]]
```

I realized that if I take everything but the last item (using `first`) and take
everything but the first item (using `last`), then I can `zip` those two arrays
together into the list of tuples I was looking for.
