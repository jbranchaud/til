# Write Safer Where Clauses With Placeholders

Ruby has a super ergonomic syntax for string interpolation. This can make it
tempting to build up ActiveRecord `where` clauses like so:

```ruby
def get_book_by_title(title)
  Book.where("lower(title) = #{title.downcase}")
end
```

The `where` clause, as written, is vulnerable to a SQL injection attack.

There are two kinds of placeholder syntax that you can use instead handle
sanitization of the SQL.

```ruby
def get_book_by_title(title)
  Book.where("lower(title) = ?", title.downcase)
end
```

You can use multiple `?` in the query and they same number of following
arguments will be interpolated in order.

There is also the keyword placeholder syntax which can give you more
flexibility and make the SQL read more clearly.

```ruby
def get_book_by_title(title)
  Book.where("lower(title) = :title", title: title.downcase)
end
```

[source](https://devdocs.io/rails~5.2/activerecord/querymethods#method-i-where)
