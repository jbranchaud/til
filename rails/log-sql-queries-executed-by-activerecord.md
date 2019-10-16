# Log SQL Queries Executed By ActiveRecord

When entering ActiveRecord statements in a Rails console, it can be useful to
see what SQL queries are being executed under the hood.

```ruby
> Book.first
  Book Load (25.6ms)  SELECT  "books".* FROM "books" ORDER BY "books"."id" ASC LIMIT $1  [["LIMIT", 1]]
=> #<Book:0x00007f824ec6ff98
```

Notice the line right after the statement shows the corresponding `select`
query.

If you aren't seeing this line of SQL, then you'll need to turn on logging for
ActiveRecord. For instance, your test environment may not be configured to log
the SQL.

Right in your console, try running the following line:

```ruby
> ActiveRecord::Base.logger = Logger.new(STDOUT)
```

Enter an ActiveRecord statement, you should now be seeing the corresponding SQL
queries.

[source](https://stackoverflow.com/a/2936016/535590)
