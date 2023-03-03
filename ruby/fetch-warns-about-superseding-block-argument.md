# Fetch Warns About Superseding Block Argument

[Ruby's `#fetch`](https://ruby-doc.org/core-2.5.1/Hash.html#method-i-fetch) can
be used in a couple ways beyond just grabbing the value out of a hash.

If you include a second argument in the `#fetch` call, that will be treated as
a default value to fallback to when the first argument key doesn't appear in
the hash.

If you instead specify a block argument, that block will be executed when the
key is missing.

What happens when you specify both a second argument and a block argument?

```ruby
data = { taco: 'bell' }

data.fetch(:burrito, 'house') do
  puts 'the block gets executed'
  'shack'
end

warning: block supersedes default value argument
the block gets executed
=> 'shack'
```

The block argument wins. The second argument is ignored. And Ruby warns you
that, "block supersedes default value argument".
