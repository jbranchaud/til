# Turn Key And Value Arrays Into A Hash

Let's say you have an array of keys and an array of values:

```ruby
keys = [:title, :author, :year]
values = ["The Fifth Season", "N. K. Jemisin", 2015]
```

You can turn them into a hash where the keys of that hash come from `keys` and
are tied in order, one-to-one with the `values`.

A `hash` can be created from an array of tuples, where each is a key-value
pairing. Knowing this, we can `zip` the two arrays together and then turn them
into a `hash` like so:

```ruby
> Hash[keys.zip(values)]
#=> {:title=>"The Fifth Season", :author=>"N. K. Jemisin", :year=>2015}
```

[source](https://stackoverflow.com/a/23113943/535590)
