# Specify How Random Array#sample Is

A typical use of the
[`sample`](https://ruby-doc.org/core-2.4.0/Array.html#method-i-sample) method
on [`Array`](https://ruby-doc.org/core-2.4.0/Array.html) will look something
like this:

```ruby
> chars = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten

> chars.sample(6)
=> ["o", "Z", "X", "i", "8", "Y"]
```

By default, this is using `Random` (a pseudo-random number generator) to
produce a _random_ sampling of elements from your array.

The longer form of this looks like:

```ruby
> chars.sample(6, random: Random)
=> ["F", "c", "g", "I", "w", "E"]
```

Or to get reproducible results, you can specify the `Random` seed:

```ruby
> chars.sample(6, random: Random.new(123))
=> ["T", "c", "D", "K", "P", "s"]
```

If instead you want a cryptographically random sampling of elements from your
array, you can specify a different random number generator. Such as
[`SecureRandom`](https://ruby-doc.org/stdlib-2.5.1/libdoc/securerandom/rdoc/SecureRandom.html).

```ruby
> require 'securerandom'
=> true

> chars.sample(6, random: SecureRandom)
=> ["3", "C", "o", "i", "K", "4"]
```

The
[`Array#shuffle`](https://ruby-doc.org/core-2.4.0/Array.html#method-i-shuffle)
method is another example of a method that can take a `random` option.
