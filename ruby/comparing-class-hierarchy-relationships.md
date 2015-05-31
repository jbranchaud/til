# Comparing Class Hierarchy Relationships

The comparator methods (`<`,`>`, etc.) can be useful for a lot of things. In
Ruby, they can be used to compare classes in order to understand how they
relate to one another on the class hierarchy.

```ruby
# Fixnum is a subclass of Integer
> Fixnum < Integer
=> true
# Integer is not a subclass of Fixnum
> Integer < Fixnum
=> false
# Fixnum and String are not related to one another
> Fixnum < String
=> nil
```

The `<` operator will tell you if there is a subclass relationship. The `>`
operator will tell you if there is an ancestor relationship. When `nil`
results, it means the two classes do not have a direct relationship.

There are a few more of [these types of
operators](http://ruby-doc.org/core-2.2.2/Module.html#method-i-3C) on the
Module class.

[source](http://kerrizor.com/blog/2015/05/14/serendipity-and-ruby-objects/)
