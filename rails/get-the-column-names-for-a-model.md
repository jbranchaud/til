# Get The Column Names For A Model

An `ActiveRecord` model is backed by a table in your application's database. We
can get the column names for a backing table with `ActiveRecord`s help using
the `.column_names` method.

```ruby
> Book.column_names
=> ["id", "title", "publication_year", "created_at", "updated_at", "author_id", "genre"]
```

Any `ActiveRecord` model will have access to this class method.

See [the
docs](https://devdocs.io/rails~5.2/activerecord/modelschema/classmethods#method-i-column_names)
for more details.
