# ActiveRecord Query For This Or That

When including multiple `where` clauses on a query, we are adding more
specificity to the resulting `ActiveRecord` relation -- it's like saying we
want records that match this _and_ that. But what about when we want to find
records that match this _or_ that?

This is supported by `ActiveRecord` through the `or` query method.

Let's say we want all books that are either unpublished _or_ are published in
2019.

```ruby
> Book.where(status: 'unpublished').or(Book.where(publication_year: 2019))
=> #<ActiveRecord::Relation [...]>
```

This will generate SQL that includes a `where` clause like the following:

```sql
where (books.status = 'unpublished' or books.publication_year = 2019)
```

See the
[docs](https://api.rubyonrails.org/classes/ActiveRecord/QueryMethods.html#method-i-or)
for more details.
