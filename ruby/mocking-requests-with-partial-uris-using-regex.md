# Mocking Requests With Partial URIs Using Regex

Generally when mocking out requests with the
[webmock](https://github.com/bblimke/webmock) gem, we specify full request
URIs like so:

```ruby
stub_request(:post, 'http://localhost:4000/api/posts')
```

We may not want to specify the entire URI though. For instance, the host may
change or be configurable. The `stub_request` method allows us to use regex.

```ruby
stub_request(:post, %r|/api/posts|)
```

Using [the `%r` regex literal
syntax](https://ruby-doc.org/core-2.2.0/Regexp.html), we are able to avoid
escaping all of the `/` characters in our URI.

h/t Brian Dunn
