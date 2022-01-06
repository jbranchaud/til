# Check For Any Overlaps In List Of Ranges

If you have a list of things, such as meetings, you may want to be able to tell
if there are any conflicts. You could determine that by finding any overlaps in
their timeslots.

Ranges are a good way to represent any span of data, including a timeslot.

To do this in Ruby, we'll need two pieces. First, a way to determine if two
`Range` objects are overlapping. Second, an iterative utility for comparing
each range to every other range.

Here is an `overlaps?` method that uses `Range#begin` and `Range#end`.

```ruby
def overlaps?(range1, range2)
  range1.begin <= range2.end && range2.begin <= range1.end
end
```

And here is an `any_overlaps?` method to find any overlaps over a list of
ranges.

```ruby
def any_overlaps?(ranges)
  ranges.each_with_index do |range1, i|
    ranges.each_with_index do |range2, j|
      return true if i != j && overlaps?(range1, range2)
    end
  end

  false
end

puts any_overlaps?([(1..2), (3..4)]) #=> false
puts any_overlaps?([(1..2), (2..4)]) #=> true
puts any_overlaps?([(3..4), (1..5)]) #=> true
```

This second method isn't optimized, but it will work just fine for small lists
of ranges.

[source](https://stackoverflow.com/questions/39934266/check-if-two-ranges-overlap-in-ruby)
