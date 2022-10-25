# Precedence Of Logical Operators

There are two sets of logical operators that you are going to see in Ruby. The
more common and idiomatic set are `!`, `&&`, and `||`. Relative to all the
other operators in the Ruby language, these three have high precedence.

The other set of logical operators are `not`, `and`, and `or`. These ones have
relatively much lower precedence. Though they work conceptually the same.

The reason to be aware of the differences in precedence is that if you were to
mix the two sets, you could end up with unexpected results.

```ruby
> not true && false
=> true
> !true && false
=> false
```

To keep my Ruby code idiomatic and to avoid these kinds of potential logical
mixups, I stick to using nearly exclusively the first set—`!`, `&&`, and `||`.

[source](https://ruby-doc.org/core-2.6.2/doc/syntax/precedence_rdoc.html)
