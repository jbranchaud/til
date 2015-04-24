# Destructuring Arrays In Blocks

If I am iterating over a collection of arrays (let's say tuples) and I want
to access the values of those arrays within the iteration block, I may do
something like the following:

```ruby
> a = [[1,2],[3,4],[5,6]]
> a.each { |tuple| puts "#{tuple[0]} - #{tuple[1]}" }
1 - 2
3 - 4
5 - 6
```

I can, however, use array destructuring which will not only simplify the
code, but also make it more readable, explicit, and intentional.

```ruby
> a = [[1,2],[3,4],[5,6]]
> a.each { |x_coord,y_coord| puts "#{x_coord} - #{y_coord}" }
1 - 2
3 - 4
5 - 6
```

In the same way, I can destructure arrays that are part of a hash like so:

```ruby
> h = {one: [1,2], two: [3,4], three: [5,6]}
> h.each { |key, (x_coord, y_coord)| puts "#{x_coord} - #{y_coord}" }
1 - 2
3 - 4
5 - 6
```

Note the parentheses that are placed around the part that is being
destructured. Without these parentheses, ruby will interpret `x_coord` as
the whole array value and `y_coord` will be `nil`.
