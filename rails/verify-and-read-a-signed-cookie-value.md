# Verify And Read A Signed Cookie Value

Let's say a value was added as a [signed
cookie](https://apidock.com/rails/ActionDispatch/Cookies/CookieJar/signed) in a
request:

```ruby
cookies.signed[:discount] = 45
#=> Set-Cookie: discount=BAhpMg==--2c1c6906c90a3bc4fd54a51ffb41dffa4bf6b5f7; path=/
```

Generally to verify and read that value, you'd grab it from the signed cookies
included in the request.

```ruby
cookies.signed[:discount]
#=> 45
```

What if you have the signed cookie value, but not in the context of a `cookies`
object?

You can build a cookie jar from the current request and read the verified value
from that.

```ruby
cookie_value = 'BAhpMg==--2c1c6906c90a3bc4fd54a51ffb41dffa4bf6b5f7'
cookie_hash = { discount: cookie_value }

cookie_jar = ActionDispatch::Cookies::CookieJar.build(request, cookie_hash)

cookie_jar.signed[:discount]
#=> 45
```

It is also possible to [Base64 decode the
value](https://blog.bigbinary.com/2013/03/19/cookies-on-rails.html), however
that doesn't ensure that the value hasn't been tampered with.

[source](https://philna.sh/blog/2020/01/15/test-signed-cookies-in-rails/)
