# Turning Things Into Hashes

We have `#to_h` for turning things into hashes.

It works as an identity function:

```ruby
> {}.to_h
=> {}
> {hello: "world"}.to_h
=> {:hello=>"world"}
```

It works with `nil`:

```ruby
> nil.to_h
=> {}
```

Does it work with arrays?

```ruby
> [:one, 2].to_h
TypeError: wrong element type Symbol at 0 (expected array)
from (pry):36:in `to_h'
```

Yes, but only if it is an array of pairs:

```ruby
> [[:one, 2], [:three, 4]].to_h
=> {:one=>2, :three=>4}
```

It also works with `Struct` and `OpenStruct`:

```
> Person = Struct.new(:name, :age)
=> Person
> bob = Person.new("bob", 45)
=> #<struct Person name="bob", age=45>
> bob.to_h
=> {:name=>"bob", :age=>45}
```

You'll find that many other objects and gems support `#to_h` when it makes
sense.
