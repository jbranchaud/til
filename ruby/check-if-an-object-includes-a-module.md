# Check If An Object Includes A Module

You may want to know if an object's class includes a module because that will
tell you something about the object's behavior. It is another way of asking if
an object responds to a method or set of methods, assuming you know what
methods the module provides.

This can be done with the [`Module#include?`
method](https://ruby-doc.org/core-3.0.0/Module.html#method-i-include-3F).

```ruby
# assuming some object book of type Book that includes Rateable
> book.class
=> Book
> book.class.include?(Rateable)
=> true

# assuming some object author of type Author that doesn't include Rateable
> author.class
=> Author
> author.class.include?(Rateable)
=> false
```

[source](https://stackoverflow.com/a/28667632/535590)
