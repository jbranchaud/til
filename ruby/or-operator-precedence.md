# Or Operator Precedence

What's the difference between `||` and `or` in Ruby?

Let's look at an example to find out. First, let's start with some boolean
variables:

```ruby
> a, b = false, true
=> [false, true]
```

Now, let's try the different _or_ operators:

```ruby
> a || b
=> true
> a or b
=> true
```

Cool, they seem to work as expected.

Finally, let's capture the result in a variable:

```ruby
> c = a or b
=> true
> c
=> false
```

But why is `c` false and not true? Operator precedence. The assignment
operator (`=`) takes precedence over the `or` operator causing `c` to be
assigned to the value of `a` (`false`) before `or`'d with `b`.

[source](http://stackoverflow.com/questions/2083112/difference-between-or-and-in-ruby)
