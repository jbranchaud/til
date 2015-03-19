# Create an Array of Stringed Numbers

To create an array of numbers between `1` and `5`, I can do something like
the following:

```ruby
(1..5).to_a
> [1,2,3,4,5]
```

However, what if I want an array of `"1"` to `"5"`? That is, what if I want
an array of consecutive numbers as strings?

I can just reuse the above and map them to strings like so:

```ruby
(1..5).to_a.map(&:to_s)
> ['1','2','3','4','5']
```

Though, that seems more verbose than necessary. Ruby actually allows you to
do ranges of characters. Which means that I can modify my original approach
to look something like this:

```ruby
('1'..'5').to_a
> ['1','2','3','4','5']
```
