# Polymorphic Path Helpers

Underlying many of the path helpers that we use day to day when building out
the views in our Rails apps are a set of methods in the
[`ActionDispatch::Routing::PolymorphicRoutes`](http://api.rubyonrails.org/classes/ActionDispatch/Routing/PolymorphicRoutes.html)
module.

The `#polymorphic_path` method given an instance of a model will produce the
relevant show path.

```ruby
> app.polymorphic_path(Article.first)
  Article Load (0.5ms)  SELECT  "articles".* FROM "articles"  ORDER BY "articles"."id" ASC LIMIT 1
=> "/articles/2"
```

Given just the model's constant, it will produce the index path.

```ruby
> app.polymorphic_path(Article)
=> "/articles"
```

Additionally, there are variants with `edit_` and `new_` prefixed for
generating the edit and new paths respectively.

```ruby
> app.edit_polymorphic_path(Article.first)
  Article Load (0.6ms)  SELECT  "articles".* FROM "articles"  ORDER BY "articles"."id" ASC LIMIT 1
=> "/articles/2/edit"
> app.new_polymorphic_path(Article)
=> "/articles/new"
```
