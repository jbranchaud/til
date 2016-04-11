# Demodulize A Class Name

If you call `.class.name` on an instance of some class, the fully qualified
name will be returned, module names and all. Consider the following example
class:

```ruby
module One
  module Two
    class Three
      ...
    end
  end
end
```

```ruby
> One::Two::Three.new.class.name
#=> "One::Two::Three"
```

If you just want the unqualified class name; modules not included, you can
use the `#demodulize` method provided by `ActiveSupport`.

```ruby
> One::Two::Three.new.class.name.demodulize
#=> "Three"
```
