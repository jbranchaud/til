# Create A Hash From An Array Of Arrays

The `::[]` method on the `Hash` class allows you to succinctly create a hash
from an array of arrays -- or rather an array of tuples which are key value
pairs.

```ruby
> Hash[ [["a",2],["b",4]] ]
{"a"=>2, "b"=>4}
> Hash[ [[1,2],[3,4]] ]
{1=>2, 3=>4}
```

See the [`Hash::[]`
docs](http://ruby-doc.org/core-2.3.0/Hash.html#method-c-5B-5D) for more
details.

h/t Josh Davey
