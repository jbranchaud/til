# Forward All Arguments To Another Method

There are three types of arguments that a Ruby method can receive. Positional
arguments, keyword arguments, and a block argument.

A method that deals with all three might be defined like this:

```ruby
def forwarding_method(*args, **kwargs, &block)
  # implementation
end
```

Now lets say we have some concrete method that we want to forward these
arguments to:

```ruby
def concrete_method(*args, **kwargs)
  x = args.first || 1
  key, y = kwargs.first || [:a, 2]

  puts "Dealing with #{x} and key #{key}: #{y}"

  yield(x, y)
end
```

We could forward arguments the longhand way like this:

```ruby
def forwarding_method(*args, **kwargs, &block)
  concrete_method(*args, **kwargs, &block)
end
```

However, since Ruby 2.7 we have access to a shorthand "triple-dot" syntax for
forwarding all arguments.

```ruby
def forwarding_method(...)
  concrete_method(...)
end
```

[source](https://ruby-doc.org/3.3.6/syntax/methods_rdoc.html#label-Argument+Forwarding)
