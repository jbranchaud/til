# Skip Validations When Creating A Record

Validations on your
[ActiveRecord](https://api.rubyonrails.org/classes/ActiveRecord/Base.html)
models are there for a reason. They provide application-level feedback about
data that doesn't meet business requirements.  In many cases those validations
should also be pushed down to the database-layer in the form of constraints.

Sometimes, though rarely and probably only in a testing or development context,
you'll want to skip validations.

This is how you can do that when creating a new record:

```ruby
user = User.new(
  name: 'Josh',
  email: '',
  password: SecureRandom.uuid
)

user.valid?
#=> false
user.errors.messages
#=> {:email=>["can't be blank"]}

user.save(validate: false)
```

After newing-up an object with invalid data, you can [save it with the
`validate` option set to
`false`](https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-save).
This will skip ActiveRecord validations.

Note: If you also have a database-layer constraint, this won't work. Perhaps
for your use case you can get by with a new non-persisted record.
