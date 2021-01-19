# Columns With Default Values Are Nil On Create

Let's say I have a `MagicLinks` model backed by `magic_links` Postgres table.
Both the `id` and `token` columns are of type `UUID` and have default values of
`gen_random_uuid()`. That means from the Rails-side when I go to create a
`MagicLink` record, I don't have to think about specifying values for `id` or
`token` -- the DB will take care of that.

```ruby
> magic_link = MagicLink.create(expires_at: Time.zone.now, user: User.last)
  User Load (5.9ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT $1  [["LIMIT", 1]]
  TRANSACTION (0.1ms)  BEGIN
  MagicLink Create (3.1ms)  INSERT INTO "magic_links" ("user_id", "expires_at", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"
...

> magic_link.id
=> "6c6dddbf-4427-407d-8dc8-eef8cb65d491"
> magic_link.token
=> nil
```

This `create` call is translated into an `insert` SQL statement that includes a
`returning` clause. For `create` it is always `returning "id"`. This means that
the `UUID` value generated in Postgres-land for `id` gets passed back into the
ActiveRecord instance. The `UUID` value generated for `token`,  however, is not
because `token` isn't specified in the `returning` clause.

[source](https://github.com/rails/rails/issues/17605)
