# Encode A String As URL-safe Base64

Ruby's standard lib comes with a [Base64
module](https://ruby-doc.org/stdlib-2.1.4/libdoc/base64/rdoc/Base64.html)
with a number of utilities for encoding and decoding data as
[Base64](https://en.wikipedia.org/wiki/Base64). One of the methods it
provides is `urlsafe_encode64`.

```ruby
> require 'base64'
true
> Base64.urlsafe_encode64('hello')
"aGVsbG8="
> Base64.urlsafe_encode64('1')
"MQ=="
```

You can pass it any string and it will create a URL-safe Base64 encoded
representation of that string.
