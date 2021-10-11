# Grab A Random Record From The Database

I recently learned of a clever way to grab a random record for a particular
model from the database. This is handy if you are poking around in the database
to see what some records look like.

Order the records for that table randomly and then grab the first.

```ruby
Event.order('random()').first
```

This grabs a random `Event` record from the `events` table.

Note, however, that for Rails 6+, this approach won't work. Because of some
extra safety measures around executing raw SQL, you'll instead have to write
the above as:

```ruby
Event.order( Arel.sql('random()') ).first
```

This uses
[`Arel.sql`](https://api.rubyonrails.org/classes/Arel.html#method-c-sql) to
mark `'random()'` as a known-safe string of SQL.

Because we are explicitly passing a string that represents a known-safe
function call, this is fine. Take care to not pass any user-generated SQL in a
scenario like this unless you know what you're doing.

[source](https://stackoverflow.com/a/49525874/535590)
