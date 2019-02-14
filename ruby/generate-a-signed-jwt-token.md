# Generate A Signed JWT Token

The [`jwt`](https://github.com/jwt/ruby-jwt) gem is a Ruby library for
encoding and decoding JWT tokens. You can create a signed JWT with the
`#encode` method by specifying a secret and a hash algorithm.

```ruby
payload = { id: 1, email: 'user@example.com' }
secret = Rails.application.credentials.secret_key_base

token = JWT.encode(payload, secret, 'HS256')
```

This will create a JWT token that contains some JWT headers, application
data, and an encrypted secret that signs the data. This can be passed to and
from your client app as a way of identifying and authenticating a user.

See the [`jwt-ruby` docs](https://github.com/jwt/ruby-jwt) or
[jwt.io](https://jwt.io/) for more details.
