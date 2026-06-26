# Use Rescue As Part Of Inline Statement

In Ruby I typically think of `rescue` as block syntax that I can use to handle
exceptions.

```ruby
begin
  User.update!(password:)
rescue
  puts "There was an issue updating the password"
end
```

The `rescue` keyword can also be used as part of an inline statement as a way of
providing a _fallback_ value when the first part of the statement raises.

For instance, if I'm trying to access some value on an array that happens to be
`nil`, it is going to raise:

```ruby
> scores.first
(irb):7:in '<main>': undefined method 'first' for nil (NoMethodError)
```

I can instead tack on a `rescue 0` which will give it `0` as a fallback value:

```ruby
> scores.first rescue 0
=> 0
```

Of course, there are more idiomatic ways to handle this kind of situation in
Ruby. Maybe something like this:

```ruby
> Array(scores).first || 0
=> 0
```

Another way I've seen this inline rescue used is to print out the exception
caused by that line of code, using `$!` (the global variable for the most
recently raised exception).

```ruby
> scores.first rescue puts $!
undefined method 'first' for nil
=> nil
```

That is a one-liner for the following:

```ruby
begin
  scores.first
rescue => e
  puts e
end
```

The big caveat that goes with this is the same one that goes with any other
blanket `rescue` block. If you are indiscriminately rescuing exceptions without
being intentional about what you are rescuing and why, you could be potentially
burying exceptions that you need to know about.
