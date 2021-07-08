# Add Comments To Regex With Free-Spacing

Ruby's regex syntax supports a [Free-Spacing
mode](https://ruby-doc.org/core-3.0.1/Regexp.html#class-Regexp-label-Free-Spacing+Mode+and+Comments).
When this mode is enabled, all the literal whitespace in the regular expression
is ignored and comments can be included at the end of lines. This is enabled by
appending the `x` option at the end of the regex.

Here is a regex with Free-Spacing mode enabled (see the `x` at the end).

```ruby
simple_email = /\A.+@.+\z/x
```

Though it's enabled, it is not really being used.

Here is the same regular expression, but this time I've spaced it out and added
comment annotation to make the regex easier to understand.

```ruby
simple_email = /
  \A  # beginning of the string
  .+  # any opening characters
  @   # the email's `@` symbol
  .+  # the rest of the email
  \z  # the end of the string
/x
```

To be sure the extra space and comments aren't messing things up, here is some
code to test it out.

```ruby
test_emails = [
  'taco',
  'email@example.com',
  'more.complex+email@example.com',
  '@'
]

test_emails.each do |email|
  if (simple_email =~ email) == 0
    puts "#{email} looks like an email"
  else
    puts "#{email} may not be an email"
  end
end
```

[source](https://twitter.com/jasonrudolph/status/1413240725064519681?s=20)
