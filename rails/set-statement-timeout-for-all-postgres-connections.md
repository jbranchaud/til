# Set Statement Timeout For All Postgres Connections

The
[`statement_timeout`](postgres/set-a-statement-timeout-threshold-for-a-session.md)
setting in PostgreSQL allows you to head off long running queries and
migrations that could break your deploys and lock up your production tables.

This value can be set to a sensible default across all the connections your
Rails app makes to PostgreSQL. To set it, open up your `config/database.yml`
file and add a `variables` element to the default section.

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  variables:
    statement_timeout: 60000
```

That's 60 seconds in milliseconds. You can avoid the mental math by using a
string argument with a unit such as `s` for seconds.

```yaml
  variables:
    statement_timeout: '60s'
```

If you then execute a long running query, such as:

```ruby
ActiveRecord::Base.connection.execute('select pg_sleep(62)')
```

It will terminate 2 seconds early because of the statement timeout.

[source](https://til.hashrocket.com/posts/b44baf657d-railspg-statement-timeout-)
