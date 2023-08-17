# Make A String Attribute Easy to Inquire About

Have you ever been curious why Rails environment checks work the way they do?

```ruby
> Rails.env
#=> 'development'
> Rails.env.development?
#=> true
```

What is powering this is
[`ActiveSupport::StringInquirer`](https://api.rubyonrails.org/classes/ActiveSupport/StringInquirer.html).
And since it is part of `ActiveSupport`, you can use that functionality
elsewhere in your Rails code.

Let's look at an example:

```ruby
class UserWithRole
  attr_reader :name, :role

  def initialize(name, role)
    @name = name
    @role = ActiveSupport::StringInquirer.new(role)
  end
end
```

With that class defined, we can initialize a user and inquire about their role.

```ruby
> user = UserWithRole.new('Bob', 'instructor')
#=> <UserWithRole ...>
> user.role.instructor?
#=> true
> user.role.admin?
#=> false
> user.role
#=> 'instructor'
```

This helper class makes it much cleaner to inquire about the role of a user.
Notice we don't have to do a string comparison to check if they are an
instructor, e.g.:

```ruby
> user.role == 'instructor'
```
