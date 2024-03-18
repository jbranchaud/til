# Format A Hash Into A String Template

The `%` method as defined by `String`
([`String#%`](https://ruby-doc.org/core-3.0.0/String.html#method-i-25)) allows
you to format (interpolate) an object or array of values into a string. That
string needs to contain template markers for where the values should go.

Here is an example of folding an array of values into a string with [`%s`
format
specifier](https://docs.ruby-lang.org/en/master/format_specifications_rdoc.html#label-Specifier+s):

```ruby
> User = Struct.new(:id)
=> User
> user1 = User.new(123)
=> #<struct User id=123>
> "%s ID: %s" % [user1.class.to_s, user1.id]
=> "User ID: 123"
```

Or perhaps more usefully for a string that acts as a template, you can used
named specifiers that correspond to hash keys:

```ruby
> template = "You paid %{formatted_price} for %{product}. Enjoy your purchase!"
=> "You paid %{formatted_price} for %{product}. Enjoy your purchase!"

> data = { product: "Ruby Explained™", formatted_price: "$38.99" }
=> {:product=>"Ruby Explained™", :formatted_price=>"$38.99"}

> template % data
=> "You paid $38.99 for Ruby Explained™. Enjoy your purchase!"
```

[source](https://hashrocket.com/blog/posts/using-a-hash-of-data-for-string-replacement-in-ruby)
