# Update Column Versus Update Attribute

Rails offers a whole variety of methods for making updates to the ActiveRecord
objects in your app. Two unique, infrequently-used ones are
[`#update_column`](https://devdocs.io/rails~5.2/activerecord/persistence#method-i-update_column)
and
[`#update_attribute`](https://devdocs.io/rails~5.2/activerecord/persistence#method-i-update_attribute).
What is unique about them is that they are both ways of updating a record while
skipping the validations defined on the model.

So, how do they differ?

A call to `#update_attribute` is still going to trigger any callbacks defined
on the model and it will touch the `update_at` column. On the other hand,
`#update_column` can be thought of as a way of directly interacting with the
database -- callbacks are skipped and you are truly only touching the specified
column, `updated_at` is left as is.

The docs have this recommendation for `#update_attribute`:

> This is especially useful for boolean flags on existing records.

And for `#update_column`, they say this:

> This is the fastest way to update attributes because it goes straight to the
> database, but take into account that in consequence the regular update
> procedures are totally bypassed.

These are both useful in specific situations, but be sure to know their
differences and to use them with caution.
