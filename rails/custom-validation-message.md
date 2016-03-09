# Custom Validation Message

When using Rails validations, a standard error message will be provided
whenever there is a violation. Consider the scenario when there is a
uniqueness validation on the email attribute and it is violated:

```ruby
# User model
validates_uniqueness_of :email

# Users controller
new_user.errors.full_messages
#=> ["Email has already been taken"]
```

Sometimes you don't want the default validation message. The validation
declaration can be given a `message` option to specify an alternate
validation message.

```ruby
# User model
validates_uniqueness_of :email, message: 'is not available'

# Users controller
new_user.errors.full_messages
#=> ["Email is not available"]
```

Keep in mind that `full_messages` will prepend the model name to the front
of the message. You'll want to ensure that the resulting message is
coherent.
