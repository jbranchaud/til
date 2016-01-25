# Returning With Sequel

The [`sequel`](https://github.com/jeremyevans/sequel) gem is a database
toolkit that allows you to interact with most databases. PostgreSQL has
support for composite primary keys, but `sequel`, which is supposed to return
the `id` of newly inserted records, isn't sure what to return when faced
with a composite primary key. You can get around this by telling `sequel`
exactly what should be returned using the `#returning` method. For instance,
get it to return just the `id` of the new record:

```ruby
DB[:floors].returning(:id).insert(hotel_id: 4, id: 1, ...)
# [{id: 1}]
```

To get it to return both parts of composite key:

```ruby
DB[:floors].returning(:id, :hotel_id).insert(hotel_id: 4, id: 1, ...)
# [{id: 1, hotel_id: 4}]
```
