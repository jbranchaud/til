# Convert A Symbol To A Constant

If you have a symbol and need to convert it to a constant, perhaps because
of some metaprogramming induced by a polymorphic solution, then you may
start off on an approach like the following. In fact, I've seen a number of
StackOverflow solutions like this.

```ruby
:module.to_s.capitalize.constantize
#=> Module
```

That is great for one-word constant names, but what about multi-word
constants like `OpenStruct`. This approach will not work for the symbol
`:open_struct`. We need a more general solution.

The key is to ditch `#capitalize and instead use another ActiveSupport
method, `#classify`.

```ruby
:open_struct.to_s.classify.constantize
#=> OpenStruct
```
