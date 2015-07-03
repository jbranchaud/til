# Question Mark Operator

Ruby has a question mark (`?`) operator that works like so

```ruby
> ?a
=> "a"
> ?\s
=> " "
> ??
=> "?"
> ?a + ?b + ?c
=> "abc"
```

It essentially creates single character strings. At least in Ruby 1.9+ it
does. In versions of Ruby before 1.9, the `?` operator could be used to get
the ascii character code of the operand character.

h/t Josh Davey

[source](http://stackoverflow.com/questions/16641205/what-does-the-question-mark-operator-do)
