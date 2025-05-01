# Format DateTime With Builtin Formats

The Rails [`Date`](https://api.rubyonrails.org/classes/Date.html)/`DateTime`
and [`Time`](https://api.rubyonrails.org/classes/Time.html) classes each come
with a `DATE_FORMATS` constant that is a hash of symbol names to format
strings.

```ruby
> DateTime::DATE_FORMATS
=>
{:short=>"%d %b",
 :long=>"%B %d, %Y",
 :db=>"%Y-%m-%d",
 :inspect=>"%Y-%m-%d",
 :number=>"%Y%m%d",
 :long_ordinal=>
  #<Proc:0x0000000105b2cef0 /Users/jbranchaud/.local/share/mise/installs/ruby/3.2.2/lib/ruby/gems/3.2.0/gems/activesupport-8.0.1/lib/active_support/core_ext/date/conversions.rb:15 (lambda)>,
 :rfc822=>"%d %b %Y",
 :rfc2822=>"%d %b %Y",
 :iso8601=>
  #<Proc:0x0000000105b2cec8 /Users/jbranchaud/.local/share/mise/installs/ruby/3.2.2/lib/ruby/gems/3.2.0/gems/activesupport-8.0.1/lib/active_support/core_ext/date/conversions.rb:21 (lambda)>}
```

These can be used as a standardized, ready-to-use, named formats when turning
`DateTime` objects into strings.

Here are a few examples

```ruby
> now = DateTime.now
=> Wed, 30 Apr 2025 23:08:08 -0500

> now.to_fs(:long)
=> "April 30, 2025 23:08"

> now.to_fs(:long_ordinal)
=> "April 30th, 2025 23:08"

> now.to_fs(:iso8601)
=> "2025-04-30T23:08:08-05:00"
```

If an unrecognized key is passed to `#to_fs`, then it falls back to the
`:iso8601` format.

```ruby
> now.to_fs(:taco_bell)
=> "2025-04-30T23:08:08-05:00"
```
