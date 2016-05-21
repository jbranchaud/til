# Up And Down With Integers

Ruby's [`Integer`](http://ruby-doc.org/core-2.2.0/Integer.html) class comes
with an `#upto` and a `#downto` method. Both of these methods can be used to
iterate from one number up or down to, respectively, another number.

Let's count to 3

```ruby
> 1.upto(3) { |x| puts x }
1
2
3
```

This of course can easily and perhaps more idiomatically be accomplished
with a range and the `#each` method (e.g. `(1..3).each { |x| puts x }`.

We cannot, however, simulate the `#downto` method with a range (at least,
not very cleanly). So, if you need to count down to something, this is going
to be the cleanest and clearest way.

```ruby
> 5.downto(2) { |x| puts x }
5
4
3
2
```

The return value for both methods is always the integer we started with.
