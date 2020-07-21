# Get An Empty ActiveRecord Relation

When you query for something (with `#where`) and there are no results matching
that query, you get something that looks like an empty array (`[]`), but it's
not quite.

```ruby
> result
[]
> result.class
Book::ActiveRecord_Relation
```

It's an empty [`ActiveRecord`
relation](https://api.rubyonrails.org/classes/ActiveRecord/Relation.html).

You can get an instance of an empty `ActiveRecord` relation without
constructing a _no result_ query.

```ruby
> Book.none
[]
> Book.none.class
Book::ActiveRecord_Relation
```

I can think of a couple scenarios where this would be useful:

- as a default value for a method parameter
- as a test value for a method that expects to have an `ActiveRecord` relation
  passed in

[source](https://stackoverflow.com/questions/4877931/how-to-return-an-empty-activerecord-relation)
