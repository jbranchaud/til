# Last Raised Exception In The Call Stack

In Ruby, the `$!` global variable contains the last exception that was
raised in the current call stack. This makes it trivial to check what error
is being rescued even if it hasn't been captured in a local variable.

```ruby
class MyError < StandardError; end

def do_stuff
  raise MyError
rescue
  puts "rescuing #{$!}"
end

do_stuff
#=> rescuing MyError
```
