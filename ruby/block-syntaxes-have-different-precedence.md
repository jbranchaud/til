# Block Syntaxes Have Different Precedence

There are two syntaxes for defining a block in Ruby. The semantically shorthand
syntax uses the curly braces (`{}`). The semantically multi-line syntax uses
`do` and `end`. For nearly all intents and purposes they are interchangable.

It is, however, worth noting that the `do`/`end` version has a lower precedence
than the already low precedence of `{}`. That said, you have to write some
weird code for this to become an issue.

Let's say we have two methods, `method_one` and `method_two`. They are both
called on the same line like below and then followed by a block argument. Which
method receives the block argument?

```ruby
method_one method_two { |n|
  puts "Executing a block: #{n}"
}

method_one method_two do |n|
  puts "Executing a block: #{n}"
end
```

In the first case, with the curly braces, `method_two` receives the block as an
argument. In the second case, with the `do`/`end`, `method_one` receives the
block as an argument.

[source](http://localhost:3131/ruby-operators/curly-braces#block-shorthand)
