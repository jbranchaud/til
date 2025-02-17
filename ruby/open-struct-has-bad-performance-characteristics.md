# OpenStruct Has Bad Performance Characteristics

The Ruby docs for `OpenStruct` have a [_Caveats_
section](https://ruby-doc.org/3.4.1/stdlibs/ostruct/OpenStruct.html#class-OpenStruct-label-Caveats)
that warns about the poor performance characteristics of `OpenStruct` relative
to `Struct` and `Hash`.

> This should be a consideration if there is a concern about the performance of
> the objects that are created, as there is much more overhead in the setting
> of these properties compared to using a Hash or a Struct. Creating an open
> struct from a small Hash and accessing a few of the entries can be 200 times
> slower than accessing the hash directly.

This doesn't mean don't use `OpenStruct`, but do be aware of if you are using
it in a hot path or if you are allocating and processing tons of them.

If you turn on _Performance Warnings_ in Ruby, you'll see a warning message
when allocating an `OpenStruct`.

```ruby
> require 'ostruct'
=> true
> os1 = OpenStruct.new
=> #<OpenStruct>
> Warning[:performance] = true
=> true
> os2 = OpenStruct.new
(irb):6: warning: OpenStruct use is discouraged for performance reasons
=> #<OpenStruct>
```

[source](https://www.reddit.com/r/ruby/comments/1d54mwl/comment/l6jgn59/)
