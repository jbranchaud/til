# Skip The Front Of An Array With Drop

I've long been familiar with Ruby's
[`Array#take`](https://apidock.com/ruby/Array/take) which is a handy way to
grab the first few elements of an array.

```ruby
> [:a, :b, :c, :d, :e, :f, :g].take(4)
=> [:a, :b, :c, :d]
```

But what if I want to skip those first four elements of the array and get what
remains. That is where [`Array#drop`](https://apidock.com/ruby/Array/drop)
comes in.

```ruby
> [:a, :b, :c, :d, :e, :f, :g].drop(4)
=> [:e, :f, :g]
```

How about a couple practical situations for use in a Rails app.

Here I want to segment out the first 6 books and whatever remains:

```
def index
  @books = Book.order(created_at: :desc).limit(10)

  @featured_books = @books.take(6)
  @remaining_books = @books.drop(6)
end
```

Or, what about cleaning up all but the first of these duplicate records:

```
Book
  .where(title: "The Murder of Roger Ackroyd")
  .drop(1)
  .each { |duplicate_book| duplicate_book.destroy }
```

The first record is ignored (dropped from the array) and the following records
are processed by the `#each` where they get destroyed.
