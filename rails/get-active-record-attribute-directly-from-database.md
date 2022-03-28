# Get ActiveRecord Attribute Directly From Database

In Rails, an ActiveRecord model will automatically get methods named after each
column in the backing database table. This can be called to retrieve those
values from the respective columns in the database.

What if you wanted to override and alter one of those values? For example,
ensure the `email` value you're passing around is always fully downcased.

Something like this won't quite work.

```ruby
def email
  email.downcase
end
```

Because the method is named `email`, the `email` reference inside it will call
itself, recursively, until it exceeds the stack.

Instead, you need a way of referencing the email attribute that is stored in
the database.
[`attribute_in_database`](https://api.rubyonrails.org/classes/ActiveRecord/AttributeMethods/Dirty.html#method-i-attribute_in_database)
will do the trick.

```ruby
def email
  attribute_in_database('email').downcase
end
```

That will retrieve the value from the `email` column in the database for this
record, downcase it, and return it. Anyone calling `email` won't notice the
difference.

h/t [Dillon Hafer](https://twitter.com/dillonhafer)
