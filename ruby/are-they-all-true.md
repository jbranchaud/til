# Are They All True?

There is a method on `Enumerable` that allows you to check against
everything in a collection. This is the `all?` method.
For instance, if you want to check if an array of values are all
truthy, you can call it without arguments:

```ruby
> [true, 1, ''].all?
# true
> [true, false, true].all?
# false
```

You can also pass it a block which is helpful if you want to check an
attribute or method on a collection of objects, like so:

```ruby
> employees.all?(&:salaried?)
# true
> [1,2,3,4,5].all?(&:odd?)
# false
```
