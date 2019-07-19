# What To Do When You Don't Rescue

Ruby's `rescue` syntax supports a couple different blocks. I was already
familiar with `ensure` which is a block of code that will be executed
regardless of whether or not an exception was rescued.

```ruby
begin
  do_something_that_could_fail()
rescue StandardError => e
  # oh no!
ensure
  Logging.info("We attempted to do the thing.")
end
```

What if you want to differentiatee between an instance when your code ran
without incident and when there was an exception? Ruby's `rescue` syntax also
supports an `else` block. The `else` block is executed only when nothing is
rescued.

```ruby
begin
  do_something_that_could_fail()
rescue StandardError => e
  Logging.info("We tried to do something and it failed.")
else
  Logging.info("We successfully did the thing!")
end
```

There are a lot of ways to use this. Here I was able to differentiate the
messaging in my logging based on whether or not an exception occurred.

[source](https://blog.bigbinary.com/2017/10/24/ruby-2.5-allows-rescue-inside-do-end-blocks.html)
