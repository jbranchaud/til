# Uncaught Exceptions In Pry

You are fiddling around with some code in a pry session trying to
familiarize yourself with how it all works. You suddenly execute a statement
that results in an uncaught exception. You'd like to take a closer look at
the exception. Pry makes this easy by exposing the `_ex_` variable which
points to the last uncaught exception.

Try it out in a pry session:

```ruby
> class MyError < StandardError; end
=> nil
> def do_stuff; raise MyError, "Something bad happened"; end
=> :do_stuff
> do_stuff
MyError: Something bad happened
from (pry):2:in `do_stuff'
> _ex_
=> #<MyError: Something bad happened>
```
