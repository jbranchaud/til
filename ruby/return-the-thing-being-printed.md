# Return The Thing Being Printed

The [`puts`](https://ruby-doc.org/core-3.0.2/Kernel.html#method-i-puts) method
is the canonical way of priting things to stdout in Ruby. Notably, its return
value is always `nil`. Generally this isn't much of an issue, but can be a
potential gotcha while debugging.

Consider the following method whose behavior you are trying to investigate:

```ruby
def process(arg)
  thing = do_something(arg)

  thing.value
end
```

I want to print out the value of thing when I execute the code to see what it
is while debugging. So I add a `puts` statement.

```ruby
def process(arg)
  thing = do_something(arg)

  puts thing.value
end
```

Well, I just broke the behavior of `process` because it now returns `nil`
instead of `thing.value`.

I could add an additional line that returns the correct value. Or I could use
[`p`](https://ruby-doc.org/core-3.0.2/Kernel.html#method-i-p) which both prints
its argument to stdout and returns it as is.

```ruby
def process(arg)
  thing = do_something(arg)

  p thing.value
end
```

[source](https://dev.to/lofiandcode/ruby-puts-vs-print-vs-p-vs-pp-vs-awesome-5akl)
