# Who Are My Ancestors?

Ruby's `Module` class provides the
[`#ancestors`](http://ruby-doc.org/core-2.1.0/Module.html#method-i-ancestors)
method. This method allows you to determine the ancestors (parents,
grandparents, etc.) of a given class.

```ruby
> 5.class.ancestors
=> [Fixnum, Integer, Numeric, Comparable, Object, PP::ObjectMixin, Kernel, BasicObject]
> Array.ancestors
=> [Array, Enumerable, Object, PP::ObjectMixin, Kernel, BasicObject]
> Class.ancestors
=> [Class, Module, Object, PP::ObjectMixin, Kernel, BasicObject]
> BasicObject.ancestors
=> [BasicObject]
```
