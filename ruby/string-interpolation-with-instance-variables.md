# String Interpolation With Instance Variables

When using regular variables with string interpolation in Ruby, they must be
wrapped in curly braces (e.g. `"This is a #{variable}"`). With instance
variables (and class and global variables) you can just use the _octothorp_
followed directly by the variable.

Here is an example of this in action:

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def whoami
    puts "I am #@name"
  end
end

bob = Person.new("bob")
#=> #<Person:0x007fdaf3291618 @name="bob">

bob.whoami
# I am bob
```

This is a handy shortcut, but may affect readability and/or result in an
interpolation error at some point. Your mileage may vary.

h/t Josh Davey
