# Gather Positional Arguments In Method Definition

The `*` symbol can be used in Ruby in a method definition to gather up an
arbitrary number of positional arguments.

For instance, we can gather all positional arguments with this method
definition:

```ruby
def gather_all(*args)
  puts args
end
```

Or we can isolate the first positional arg and then gather the rest:

```ruby
def first_and_rest(first, *rest)
  puts "First: #{first}, Rest: #{rest}"
end
```

We can even do something a bit more interesting like isolating the first and
last arguments while gathering up everything else in the middle:

```ruby
def pop_parens(left, *middle, right)
  if left != '(' || right != ')'
    raise "Uh oh!"
  else
    if middle.size == 1
      puts "Found: #{middle.first}"
    else
      pop_parens(*middle)
    end
  end
end
```

Here is what it looks like if we splat some different sets of arguments into
that method call:

```ruby
> tokens1 = "((((4))))".split('')
=> ["(", "(", "(", "(", "4", ")", ")", ")", ")"]
> tokens2 = "((4))))".split('')
=> ["(", "(", "4", ")", ")", ")", ")"]
> pop_parens(*tokens1)
Found: 4
=> nil
> pop_parens(*tokens2)
(irb):87:in `pop_parens': Uh oh! (RuntimeError)
```

[source](https://ruby-doc.org/3.3.6/syntax/methods_rdoc.html#label-Array-2FHash+Argument)
