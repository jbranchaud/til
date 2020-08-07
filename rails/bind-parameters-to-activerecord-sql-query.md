# Bind Parameters To ActiveRecord SQL Query

Many of the connection query methods that come with `ActiveRecord` accept an
optional `binds` parameter. This can be used to safely inject parameters into
the query.

Here's a SQL query we could use with one of these methods:

```ruby
sql = <<-SQL
  select
    coalesce(places.latitude, 41.8781) latitude,
    coalesce(places.longitude, -87.6298) longitude
  from places
  join appointments
    on places.id = apointments.places_id
  where appointments.id = $1
    and status = $2
SQL
```

Notice the `$1` and `$2`, those are what will be bound to the two parameters
included as `binds`.

```ruby
connection = ActiveRecord::Base.connection

binds = [[nil, appt_id], [nil, input_status]]
coords = connection.select_one(sql, nil, binds)

coords
#=> { "latitude": 41.8781, "longitude": -87.6298 }
```

Notice the `binds` is an array of tuples. It's the second value in each tuple
that gets bound the corresponding binding indicator in the sql. The syntax is a
bit awkward since it is a lower-level API, however once you know it, you can
manage.
