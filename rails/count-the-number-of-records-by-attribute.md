# Count The Number Of Records By Attribute

In [Count How Many Records There Are Of Each
Type](postgres/count-how-many-records-there-are-of-each-type.md), I walked
through how to use SQL (in PostgreSQL) to get a count of how many records there
are with each unique value in a given column. This is something I tend to do
with a `type` or `status` column.

We can ask the same question with Rails, with very little code. It produces a
nearly identical query and the same results.

```ruby
> Book.group(:status).count
#=> { nil => 123, "published" => 611, "draft" => 364, "review" => 239 }
```

We've picked the `Book` model and we want it to group books by their `status`.
Tacking on the `#count` at the end tells it to apply the `count` aggregate. The
result is a hash of each unique value of the specified attribute (`status`)
paired with the count.
