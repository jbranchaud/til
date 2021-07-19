# A Basic Case Statement

The syntax for case statements (or switch statements) is a little different for
each language. I often confuse the Ruby and JavaScript syntax or wonder if I
need to be using a colon anywhere.

Here is a demonstration of how to write a basic case statement in Ruby.

```ruby
case ['taco', 'burrito', 'pizza', nil].sample
when 'taco'
  puts 'Taco, eh. Carne asada or al pastor?'
when 'burrito'
  puts 'Burrito, eh. Want it smothered?'
when 'pizza'
  puts 'Pizza, eh. Cheese or pepperoni?'
else
  puts 'What do you want to eat?'
end
```

This next example demonstrates two things. First, you can make things terser
with the `then` syntax. Second, the case statement does an implicit return of
whatever the last value is from the evaluated case. So it can be used as part
of a variable assignment.

```ruby
question =
  case ['taco', 'burrito', 'pizza', nil].sample
  when 'taco' then 'Taco, eh. Carne asada or al pastor?'
  when 'burrito' then 'Burrito, eh. Want it smothered?'
  when 'pizza' then 'Pizza, eh. Cheese or pepperoni?'
  else 'What do you want to eat?'
  end

puts question
```
