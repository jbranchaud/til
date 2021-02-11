# Retry A Block After An Exception

Ruby comes with a [_retry_
mechanism](https://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-retry)
that allows you to recover from known exceptions by retrying the code that led
to the exception. In network or timing-based situations where race conditions
are possible, the most straightforward recourse may be to just _retry_ a couple
times.

Set up a `begin` / `rescue` block like you'd normally do for a chunk of code
that may raise an exception. Then add a `retry` call to the `rescue` block.

```ruby
begin
  puts "About to do a thing (#{retries})"

  raise StandardError if rand(5) != 4

  puts "Success!"
rescue StandardError => e
  retry
end
```

If an exception is raised, this will tell Ruby to re-execute the code in the
`begin` block over and over until the exception isn't raised.

To avoid an infinite loop, you can limit the retries with a counting variable.

```ruby
begin
  retries ||= 0
  puts "About to do a thing (#{retries})"

  raise StandardError if rand(5) != 4

  puts "Success!"
rescue StandardError => e
  retry if (retries += 1) < 3

  # all retries failed, re-raise exception
  raise e
end
```

This will re-raise after 3 tries.

Here is the [full example](https://gist.github.com/jbranchaud/629fb3b9d55c817e5c9fc480790dfabc)

[source](https://www.honeybadger.io/blog/how-to-try-again-when-exceptions-happen-in-ruby/)
