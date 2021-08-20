# Define A Method On A Struct

When defining a Ruby `Struct`, you can optionally pass it a block that defines
any number of methods as instance methods on that `Struct`. They can reference
the attributes of the `Struct`.

Here is an example of a person `Struct` with a `full_name` method that uses the
`first_name` and `last_name` attributes.

```ruby
Person = Struct.new(:first_name, :last_name, :age) do
  def full_name
    "#{first_name} #{last_name}"
  end
end
```

This `Struct` can be used like so:

```ruby
> liz = Person.new("Liz", "Lemon", 39)
=> #<struct Person first_name="Liz", last_name="Lemon", age=39>
> liz.full_name
=> "Liz Lemon"
```

This is a great way to make a `Struct` just a bit more powerful without having
to convert it into a full-blown PORO (plain old Ruby object).
