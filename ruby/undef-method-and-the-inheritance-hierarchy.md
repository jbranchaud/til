# `undef_method` And The Inheritance Hierarchy

As the docs state, Ruby's
[`undef_method`](http://ruby-doc.org/core-2.2.0/Module.html#method-i-undef_method)

> prevents the current class from responding to calls to the named method.

This means you can do some weird things to the inheritance hierarchy. I'll
use the following code example to illustrate.

```ruby
class Phone
  def ring
    puts 'brrrrriiing'
  end
end

class Smartphone < Phone
  def ring
    puts 'boop beep boop'
  end
end

class Iphone < Smartphone
end

smartphone = Smartphone.new
iphone = Iphone.new

smartphone.ring
#=> boop beep boop
iphone.ring
#=> boop beep boop
```

Everything works as expect. Now, I'll use `undef_method`.

```ruby
class Smartphone
  undef_method(:ring)
end

smartphone.ring
#=> NoMethodError: undefined method `ring' for #<Smartphone:0x007fd0a20b7960>
iphone.ring
#=> NoMethodError: undefined method `ring' for #<Iphone:0x007fd0a20b7938>
```

Not only have instances of `Smartphone` been prevented from responding to
`ring`, but any subclasses of `Smartphone` that call `ring` will get tripped
up when traversing the inheritance hierarchy in search of a definition of
`ring`.
