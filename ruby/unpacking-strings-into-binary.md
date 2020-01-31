# Unpacking Strings Into Binary

You can find the binary representation of a given string by decoding it. Ruby
comes equipped with the [`#unpack`](https://apidock.com/ruby/String/unpack)
method on the `String` class that can do this decoding.

Though there are a variety of formats to decode a string into, here are some
example of decoding different characters into binary.

```ruby
> "A".unpack("B*")
=> ["01000001"]
```

The `B*` says _unpack_ this into as many *B*inary digits as are needed. The
UTF-8 encoding, means only a single byte (8-bits) are needed to represent
`"A"`.

```ruby
irb(main):002:0> "Æ".unpack("B*")
=> ["1100001110000110"]
irb(main):003:0> "Æ".unpack("B8 B8")
=> ["11000011", "10000110"]
```

`"Æ"` is represented by two bytes. We can unpack each byte seprarately using
`"B8 B8"`.

```ruby
irb(main):004:0> "木".unpack("B*")
=> ["111001101001110010101000"]
irb(main):005:0> "木".unpack("B8 B8 B8")
=> ["11100110", "10011100", "10101000"]
```

Similarly, this Japanese character is represented by three bytes of data.

```ruby
irb(main):006:0> "👻".unpack("B*")
=> ["11110000100111111001000110111011"]
irb(main):007:0> "👻".unpack("B8 B8 B8 B8")
=> ["11110000", "10011111", "10010001", "10111011"]
```

Lastly, emojis generally require four bytes of data.

[source](https://www.honeybadger.io/blog/the-rubyist-guide-to-unicode-utf8/)
