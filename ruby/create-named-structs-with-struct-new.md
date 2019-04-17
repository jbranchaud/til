# Create Named Structs With Struct.new

I often see `Struct` used to create some one-off anonymous data structure
like so:

```ruby
> person = Struct.new(:name, :age)
=> #<Class:0x007fc6c89112e8>
> person.new("Alice", 33)
=> #<struct name="Alice", age=33>
```

This will often get the job done, but on its own the resulting data
structure doesn't tell us as much as it could.

We can say more with a _named_ struct:

```ruby
Struct.new("Person", :name, :age)
=> Struct::Person
> Struct::Person.new("Bob", 24)
=> #<struct Struct::Person name="Bob", age=24>
```

When the first argument is a string that can be converted to a constant,
then we'll get a named struct that is subclassed under `Struct`.

We can also assign the struct initialization to a constant to do a similar
thing:

```ruby
> Person = Struct.new(:name, :age)
=> Person
> Person.new("Jerry", 45)
=> #<struct Person name="Jerry", age=45>
```

[source](https://ruby-doc.org/core-2.4.2/Struct.html#method-c-new)
