# Disambiguate Where In A Joined Relation

When you join two tables using ActiveRecord

```ruby
Post.joins(:author)
```

You get a relation that involves both of the tables. This allows you to
write queries that work off the data in that join.

The primary table in the join is `posts`. Any column references in a
`#where` call will be assumed to be related to `posts`. If you want to
reference a column on the `authors` table, you'll need to provide that
specificity.

The hash syntax for `#where` is a great way to do that:

```ruby
Post.joins(:author).where({ authors: { name: "John Steinbeck" }})
```

You can also use the string syntax:

```ruby
Post.joins(:author).where("authors.name = ?", "John Steinbeck")
```

[source](https://apidock.com/rails/v4.2.7/ActiveRecord/QueryMethods/where)
