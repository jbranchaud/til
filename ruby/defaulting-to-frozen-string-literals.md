# Defaulting To Frozen String Literals

> The cold never bothered me anyway.

The release of Ruby 2.2 introduced the ability to freeze string literals,
making them immutable. With the release of Ruby 2.3, strings can be frozen
by default without the use of `#freeze`. By adding the following magic
comment at the top of a file

```ruby
# frozen_string_literal: true
```

all string literals will default to frozen. That means that all string
literals in that file are immutable, cannot be modified. This gives the Ruby
interpreter some performance gains due to reduced object allocation.

This is the [issue](https://bugs.ruby-lang.org/issues/11473) that introduced
it.
