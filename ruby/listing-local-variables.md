# Listing Local Variables

In Ruby 2.2, the `binding` object gives us access to a method
`#local_variables` which returns the symbol names of the binding's local
variables. We can see this in action with

```ruby
def square(x)
  puts binding.local_variables.inspect
  x.times do |a|
    puts binding.local_variables.inspect
  end
  z = x * x
  puts binding.local_variables.inspect
  z
end
square(2)
```

which results in

```ruby
[:x, :z]
[:a, :x, :z]
[:a, :x, :z]
[:x, :z]
=> 4
```

[source](http://ruby-doc.org/core-2.2.0/Binding.html#method-i-local_variables)
