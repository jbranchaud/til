# Refer To Implicit Block Argument With It

One of the key features of the Ruby 3.4 release is the `it` implicit block
argument.

The vast majority of inline blocks defined in Ruby code receive a single block
argument. Typically we name and reference a block argument explictly like so:

```ruby
items.map { |item| item * item }
```

Ruby likes to cut away excess syntax when possible. To that end, the implicit
`it` block argument has been added. This is an identifier we can reference in
the context of a block and its value is the current

```ruby
items = [1,2,3,4,5]

squares = items.map { it * it }

pp squares
#=> [1, 4, 9, 16, 25]
```

Note: we cannot mix numbered parameters (`_1`, `_2`) with the `it` parameter.
If we do, we'll get the following error:

```ruby
def method_using_block(a, b)
  yield(a, b) if block_given?
end

puts method_using_block(4,5) { _2 ** _1 } #=> 625
puts method_using_block(4,5) { _2 ** it }
# it_block.rb:12: syntax error found (SyntaxError)
#   10 |
#   11 | puts method_using_block(4,5) { _2 ** _1 }
# > 12 | ... it }
#      |     ^~ `it` is not allowed when a numbered parameter is already used
```

[source](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
