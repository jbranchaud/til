# Change The Time Zone Offset Of A DateTime Object

Let's say you have a timestamp string that you parse with
[`DateTime.parse`](https://ruby-doc.org/stdlib-2.6.1/libdoc/date/rdoc/DateTime.html#method-c-parse).

```ruby
> DateTime.parse('2021-02-23T11:59:11')
#=> Tue, 23 Feb 2021 11:59:11 +0000
```

Without the specification of a time zone offset in the timestamp string, it
will be parsed as UTC.

If you want to change it to another time zone, you can alter the `offset`
option of the `DateTime` object. Rails provides the
[`#change`](https://api.rubyonrails.org/classes/DateTime.html#method-i-change)
method for doing this.

```ruby
> DateTime.parse('2021-02-23T11:59:11').change(offset: '-600')
#=> Tue, 23 Feb 2021 11:59:11 -0600
```

By changing the `offset` to `-600`, the `DateTime` now represents a time in
Central Time.

[source](https://stackoverflow.com/a/47861810/535590)
