# Construct A Constant From A String

Ruby's
[`Module.const_get`](http://ruby-doc.org/core-2.1.0/Module.html#method-i-const_get)
can be used to look for and retrieve the constant for a given name.

This can be used to construct a class name

```ruby
> Object.const_get("Math")
#=> Math
> Object.const_get("Math")::PI
#=> 3.141592653589793
```

It can also be used to reference a constant

```ruby
> Object.const_get("Math::PI")
#=> 3.141592653589793
```

You can even be more specific if you'd like

```ruby
> Math.const_get("PI")
#=> 3.141592653589793
```

Symbols are valid as well

```ruby
> Math.const_get(:PI)
#=> 3.141592653589793
```
