# Parse Request Params In Rack::Attack Block

The [`Rack::Attack` docs](https://github.com/rack/rack-attack) demonstrate a
way of throttling requests based on a value in the request params. In this
example, it is a Sign In endpoint and the `email` is the discriminating value.

```ruby
Rack::Attack.throttle('limit logins per email', limit: 6, period: 60) do |req|
  if req.path == '/login' && req.post?
    # Normalize the email, using the same logic as your authentication process, to
    # protect against rate limit bypasses.
    req.params['email'].to_s.downcase.gsub(/\s+/, "")
  end
end
```

Depending on the particulars of your middleware, it may be the case that
`req.params` is empty. That is because the request params need to be manually
parsed from the body of the request.

An updated example that parses the params before accessing them could look like
this:

```ruby
Rack::Attack.throttle('limit logins per email', limit: 6, period: 60) do |req|
  if req.path == '/login' && req.post?
    params = JSON.parse(req.body.string)

    # Normalize the email, using the same logic as your authentication process, to
    # protect against rate limit bypasses.
    params['email'].to_s.downcase.gsub(/\s+/, "")
  end
end
```

You can pry into the block or add some logging to ensure that you are getting
at the POST params you are interested in.

[source](https://github.com/rack/rack-attack/issues/189#issuecomment-744593703)
