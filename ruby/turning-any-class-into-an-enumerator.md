# Turning Any Class Into An Enumerator

At the core of any enumerator is the ability to respond to an `#each` call.
With that in mind, we prepare any class for being turned into an enumerator.

Consider this class `SquaresCollection` that allows you to turn an array of
integers into an array of its squares.

```ruby
class SquaresCollection
  def initialize(items)
    @items = items
  end

  def run
    @items.map { |item| item * item }
  end
end

SquaresCollection.new([1,2,3]).run #=> [1,4,9]
```

We can work with this, but it opts out of Ruby's enumerator offerings.

We can, instead, provide an `#each` method which allows instances of our
`SquaresCollection` class to be turned into enumerators.

```ruby
class SquaresCollection
  def initialize(items)
    @items = items
  end

  def each
    return enum_for(:each) unless block_given?

    @items.each do |item|
      yield item * item
    end
  end
end
```

Here is how we can use it:

```ruby
sc = SquaresCollection.new([1,2,3])

puts sc.to_enum
#=> <Enumerator ...>

puts sc.to_enum.map { |item| "* #{item} *" }
#=> ["* 1 *", "* 4 *", "* 9 *"]
```

The [`#to_enum`](https://devdocs.io/ruby~2.5/object#method-i-to_enum) method
looks for an `#each` method on the instance's class and uses that to create an
enumerator.

[source](https://blog.arkency.com/2014/01/ruby-to-enum-for-enumerator/)
