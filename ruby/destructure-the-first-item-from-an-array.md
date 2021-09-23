# Destructure The First Item From An Array

In true Ruby fashion, there are plenty of idomatic ways to get the first
item from an array.

One of the ways is with assignment destructuring of the array.

It is common to see assignment destructuring with tuples:

```ruby
> name, email = ['Liz', 'liz.lemon@nbc.com']
=> ["Liz", "liz.lemon@nbc.com"]
> name
=> "Liz"
> email
=> "liz.lemon@nbc.com"
```

If you only want the first element, try this:

```ruby
> name, *rest = ['Liz', 'liz.lemon@nbc.com']
=> ["Liz", "liz.lemon@nbc.com"]
> name
=> "Liz"
> rest
=> ["liz.lemon@nbc.com"]
```

The first element is assigned to `name` and the remaining items in the array
are assigned to `rest`. That's because of the `*`.

I like to use this approach with an array-returning method.

```ruby
> def lookup_person(id)
    ['Liz', 'liz.lemon@nbc.com', id]
  end
=> :lookup_person
> name, *rest = lookup_person(22)
=> ["Liz", "liz.lemon@nbc.com", 22]
> name
=> "Liz"
irb(main):013:0> rest
=> ["liz.lemon@nbc.com", 22]
```

This method works as expected when dealing with an empty array.

```ruby
> name, *rest = []
=> []
> name
=> nil
> rest
=> []
```

In all of these, `, *rest` is important because otherwise the statement will be
a standard variable assignment.
