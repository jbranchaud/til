# Query A Single Value From The Database

In a Rails context, most database interactions tend to happen through the ORM
(e.g. `Book.find("123")`). There is a general purpose escape hatch that lets
you execute a SQL statement directly against the DB -- `execute`. The resulting
value of `execute`, however, tends to be a little clunky to work with.

If you just need a single value from the DB, use the
[`select_value`](https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/DatabaseStatements.html#method-i-select_value)
method.

```ruby
> statement = "select gen_random_uuid()"
> ActiveRecord::Base.connection.select_value(statement)
   (5.0ms)  select gen_random_uuid()
 => "abc2e780-f442-418b-afa3-56f0ccd0a903"
```

This is the cleanest way to get the result of a "single value" query.

If you happen to pass in a query that results in more than one row or column,
it will return the value of the first column from the first row.
