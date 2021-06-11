# Build HTTP And HTTPS URLs

There are two modules you can use to build URLs in Ruby. The `URI::HTTP` module
will build URLs with the `http` protocol. And then to build URLs with the
`https` protocol, you can reach for the `URI::HTTPS` module.

We can specify just the `host` and optionally include a `port` if that is
needed.

Here is `URI::HTTP` in action.

```ruby
> URI::HTTP.build(host: 'example.com', port: 3000)
=> #<URI::HTTP http://example.com:3000>

> URI::HTTP.build(host: 'example.com', port: 3000, protocol: 'https')
=> #<URI::HTTP http://example.com:3000>
```

Note that we can try to override the protocol, but it will be ignored.

Here is the `URI::HTTPS` module.

```ruby
> URI::HTTPS.build(host: 'example.com', port: 3000)
=> #<URI::HTTPS https://example.com:3000>
```

If we want the URL as a string, we can call `#to_s` on it.

```ruby
> URI::HTTPS.build(host: 'example.com', port: 3000).to_s
=> "https://example.com:3000"
```

We can even include the `path`, though be sure to include the leading slash.

```ruby
> URI::HTTP.build(host: 'example.com', port: 3000, path: '/taco/bell')
=> #<URI::HTTP http://example.com:3000/taco/bell>

> URI::HTTP.build(host: 'example.com', port: 3000, path: 'taco/bell')
URI::InvalidComponentError: bad component(expected absolute path component): taco/bell
from /Users/jbranchaud/.asdf/installs/ruby/2.6.6/lib/ruby/2.6.0/uri/generic.rb:761:in `check_path'
```

[source](https://ruby-doc.org/stdlib-2.5.1/libdoc/uri/rdoc/URI/HTTP.html)
