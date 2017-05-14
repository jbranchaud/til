# Generating And Executing SQL

Rails' ActiveRecord can easily support 90% of the querying we do against the
tables in our database. However, there is the occasional exceptional query
that is more easily written in SQL -- perhaps that query cannot even be
written with the ActiveRecord DSL. For these instances, we need a way to
generate and execute SQL safely. The
[`sanitize_sql_array`](http://api.rubyonrails.org/classes/ActiveRecord/Sanitization/ClassMethods.html#method-i-sanitize_sql_array)
method is invaluable for this.

First, let's get a connection and some variables that we can use downstream
in our query.

```ruby
> conn = ActiveRecord::Base.connection
=> #<ActiveRecord::ConnectionAdapters::PostgreSQLAdapter ...>
> one, ten = 1, 10
=> [1, 10]
```

Now, we are ready to safely generate our SQL query as a string. We have to
use `send` because it is not publicly available. Generally, this is frowned
upon, but in my opinion it is worth breaking the private interface to ensure
our SQL is sanitized.

```ruby
> sql = ActiveRecord::Base.send(:sanitize_sql_array, ["select generate_series(?, ?);", one, ten])
=> "select generate_series(1, 10);"
```

Lastly, we can execute the query with our connection and inspect the
results.

```ruby
> result = conn.execute(sql)
   (0.4ms)  select generate_series(1, 10);
=> #<PG::Result:0x007facd93128a0 status=PGRES_TUPLES_OK ntuples=10 nfields=1 cmd_tuples=10>
> result.to_a
=> [{"generate_series"=>1},
 {"generate_series"=>2},
 {"generate_series"=>3},
 {"generate_series"=>4},
 {"generate_series"=>5},
 {"generate_series"=>6},
 {"generate_series"=>7},
 {"generate_series"=>8},
 {"generate_series"=>9},
 {"generate_series"=>10}]
```
