# Read-Only Models

Are you in the midst of a big refactoring that is phasing out an
`ActiveRecord` model? You may not be ready to wipe it from the project, but
you don't want it accidentally used to create any database records. You
essentially want your model to be read-only until it is time to actually
delete it.

This can be achieved by adding a `readonly?` method to that model that
always returns `true`.

```ruby
def readonly?
  true
end
```

`ActiveRecord`'s underlying persistence methods always check `readonly?`
before creating or updating any records.

[source](http://stackoverflow.com/questions/5641410/is-there-an-easy-way-to-make-a-rails-activerecord-model-read-only)

h/t Josh Davey
