# Using BCrypt To Create And Check Hashed Passwords

The [BCrypt](https://github.com/codahale/bcrypt-ruby) library is used under
the hood by gems like Devise in order to work with passwords securely. You
can use it to salt and hash a plain text password. You can also use it to
check whether an encrypted password matches some input password.

```ruby
> include BCrypt
=> Object

> encrypted_pass = Password.create('password')
=> "$2a$10$te3Y8wdSXf8/gWDeSP5z9eut7alThnuTvq1SvgQyJ1C57F.qit1uq"

> Password.new(encrypted_pass) == "not_my_pass"
=> false

> Password.new(encrypted_pass) == "password"
=> true
```

The `Password.create` method will salt and hash the given password. The
resulting encrypted password, if it is an instance of `Password`, can be
directly compared to a string. For good measure, in case the encrypted
password is a string, you can wrap it in a call to `Password.new` to ensure
you are working with a `Password` instance.
