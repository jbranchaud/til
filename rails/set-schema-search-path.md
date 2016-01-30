# Set Schema Search Path

By default the schema search path for a PostgreSQL database is going to be
`"$user", public`. Tables created by a Rails migration are going to end up
on the `public` schema by default. If your application has other schemas in
play, then you may want to ensure that those schemas are also on the schema
search path. This can be accomplished by adding the `schema_search_path`
setting to your `database.yml` file. For instance, to include both the
`legacy` and `public` schema in the Postgres search path, add the following
line:

```ruby
schema_search_path: "legacy,public"
```

h/t Jack Christensen
