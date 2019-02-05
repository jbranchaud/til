# Secure Passwords With Rails And Bcrypt

If you are using [`bcrypt`](https://github.com/codahale/bcrypt-ruby) (at
least version 3.1.7), then you can easily add secure password functionality
to an
[ActiveRecord](https://github.com/rails/rails/tree/master/activerecord)
model. First, ensure that the table backing the model has a
`password_digest` column. Then add
[`has_secure_password`](https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html)
to your model.

```ruby
class User < ActiveRecord::Base
  has_secure_password

  # other logic ...
end
```

You can now instantiate a `User` instance with any required fields as well
as `password` and `password_confirmation`. As long as `password` and
`password_confirmation` match then an encrypted `password_digest` will be
created and stored. You can later check a given password for the user using
the `authenticate` method.

```ruby
user = User.find_by(email: user_params[:email])

if user.authenticate(user_params[:password])
  puts 'That is the correct password!'
else
  puts 'That password did not match!'
end
```
