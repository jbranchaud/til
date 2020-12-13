# Find The Min And Max With A Single Call

Ruby's Enumerable comes with the `#min` and `#max` methods for finding,
respectively, the minimum and maximum value in the target collection.

If you wanted to find both the min and the max of the same collection, you
could call them one after another.

```ruby
list = [3,7,4,15,9,1,2]

list.min
#=> 1
list.max
#=> 15
```

Ruby's Enumerable also supports a slightly more efficient way -- it finds both
at the same time when you call
[`#minmax`](https://apidock.com/ruby/Enumerable/minmax).

```ruby
list = [3,7,4,15,9,1,2]
#=> [1,15]
```
