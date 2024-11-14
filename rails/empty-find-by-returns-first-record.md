# Empty find_by Returns First Record

During a RubyConf 2024 talk, a speaker mentioned that if you pass `nil` to
[ActiveRecord's `#find_by`
method](https://api.rubyonrails.org/classes/ActiveRecord/FinderMethods.html#method-i-find_by),
it will return the first record from the database. This is a bit unintuitive,
so lets look at an example and then I'll show you why.

```ruby
> Book.first
#=> #<Book:0x00000001142e4c48 id: 13, title: "The Secret History", ... >

> Book.find_by(nil)
#=> #<Book:0x00000001142ca3c0 id: 13, title: "The Secret History", ... >
```

So, that is the same object in both cases, but why?

Our first hint is in the SQL that gets constructed when making that method
call.

```ruby
Book Load (2.5ms)  SELECT "books".* FROM "books" LIMIT $1  [["LIMIT", 1]]
```

It's grabbing all books and limiting to _one_ result.

Lets look at the underlying implementation of the `#find_by` method.

```ruby
# File activerecord/lib/active_record/relation/finder_methods.rb, line 111
def find_by(arg, *args)
  where(arg, *args).take
end
```

Sure enough, the implementation is a `#where` followed by a `#take`. Since the
`#where` is receiving `nil` as its `arg`, there are no conditions _filtering_
the query. And the `#take` corresponds to the `limit 1`.

Knowing that, we can understand that we will also get the first record from the
database if we call `#find_by` with `{}`. Again, no conditions to filter on, so
give me all books limited to one.
