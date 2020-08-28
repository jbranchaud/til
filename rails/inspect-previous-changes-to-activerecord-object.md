# Inspect Previous Changes To ActiveRecord Object

If you modify an ActiveRecord object, before saving it, you can inspect changes
with methods like `changed?` and `<attr>_changed?`:

```ruby
book.title = "The Fifth Season"

book.changed? #=> true
book.title_changed? #=> true
book.publication_year_changed? #=> false

book.changes
#=> { "title" => ["Original Title", "The Fifth Season"] }
```

After saving an object, it will no longer be in a _dirty_ state and these
methods will have no _changes_ to return.

If you have a reference to the saved ActiveRecord object, you can look at the
_previous_ changes with methods like `previous_changes` and
`<attr>_previously_changed?`:

```ruby
book.title = "The Fifth Season"
book.save

book.title_previously_changed? #=> true
book.previous_changes
#=> { "title" => ["Original Title", "The Fifth Season"] }
```

[source](https://api.rubyonrails.org/classes/ActiveModel/Dirty.html)
