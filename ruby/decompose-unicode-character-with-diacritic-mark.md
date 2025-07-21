# Decompose Unicode Character With Diacritic Mark

A character like the `ñ` is typically represented by the unicode codepoint of
`U+00F1`. However, it is also possible to represent it with two unicode
codepoints -- the `n` (`U+006E`) and the combining diacritical mark `˜`
(`U+0303`).

We can see that by comparing a typed `ñ` with one where we split it apart into
the separate codepoints. We can do that with
[`#unicode_normalize`](https://apidock.com/ruby/v2_5_5/String/unicode_normalize)
and the `:nfd` argument which stands for _Normalized Form Decomposed_.

```ruby
> "ñ" == "ñ".unicode_normalize(:nfd)
=> false
> "ñ".unicode_normalize(:nfd).length
=> 2
> "ñ".length
=> 1
```

We can inspect the exact codepoints by iterating over each character and
printing out the codepoint value.

```ruby
"ñ".each_char.with_index do |char, i|
  puts "#{i}: '#{char}' -> U+#{char.ord.to_s(16).upcase.rjust(4, '0')}"
end
# 0: 'ñ' -> U+00F1
# => "ñ"

"ñ".unicode_normalize(:nfd).each_char.with_index do |char, i|
  puts "#{i}: '#{char}' -> U+#{char.ord.to_s(16).upcase.rjust(4, '0')}"
end
# 0: 'n' -> U+006E
# 1: '̃' -> U+0303
#=> "ñ"
```

Notice the difference after the character has been decomposed such that the
diacritic is separated from the character.

This can be done with other characters containing diacritics.

And here we go the other direction with
[`#pack`](https://ruby-doc.org/core-3.0.1/Array.html#method-i-pack).

```ruby
> [0x006E, 0x0303].pack("U*")
=> "ñ"
> [0x00F1].pack("U*")
=> "ñ"
> [0x006E, 0x0303].pack("U*") == [0x00F1].pack("U*")
=> false
```
