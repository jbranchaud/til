# Check If A URL Resolves To 200

Ruby's built-in [`Net::HTTP`
library](https://ruby-doc.org/stdlib-2.7.0/libdoc/net/http/rdoc/Net/HTTP.html)
allows us to make different kinds of HTTP requests. We can use it to make a
`HEAD` request which will request the status of a URL without actually fetching
its contents.

We can work directly with `Net::HTTP` using strings, but I find it is easier
and less error-prone to get help from the `URI` class.

To make a `#head` request, we first need to establish a connection to the host
with [the `#start`
method](https://ruby-doc.org/stdlib-2.7.0/libdoc/net/http/rdoc/Net/HTTP.html#method-i-start).
Then we can initiate our request from that connection object.

```ruby
url = 'https://my.app.com/path/to/video.mp4'
uri = URI(url)
conn = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
resp = conn.head(uri.path)

resp.code
#=> "200"
```

We initiate the connection with the host and port of our URL. Then request the
`HEAD` response for the path of our URL. If we are working with an `https` URL,
we need to indicate that with `use_ssl: true` in the `#start` method options.
