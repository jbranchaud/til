# Use A Case Statement As A Cond Statement

Many languages come with a feature that usually takes the name _cond
statement_. It is essentially another way of writing an _if-elsif-else_
statement. The first conditional in the _cond statement_ to evaluate to true
will then have its block evaluated.

Ruby doesn't have a _cond statement_, but it does have a _case statement_.
By using a _case statement_ with no arguments, we get a _cond statement_. If
we exclude arguments and then put arbitrary conditional statements after the
`when` keywords, we get a construct that acts like a _cond statement_. Check
out the following example:

```ruby
some_string = "What"

case
when some_string.downcase == some_string
  puts "The string is all lowercase."
when some_string.upcase == some_string
  puts "The string is all uppercase."
else
  puts "The string is mixed case."
end

#=> The string is mixed case.
```

[source](http://www.skorks.com/2009/08/how-a-ruby-case-statement-works-and-what-you-can-do-with-it/)
