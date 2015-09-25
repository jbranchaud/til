# Autosave False On ActiveRecord Associations

A relationship between two ActiveRecord models can be established with a
`has_one` or `has_many` association. This relationship has some
implications. By default, saving a record will also save the associated
records that have since been built. Consider this example of users that have
many posts (`has_many posts`).

```ruby
> u = User.first
#=> #<User ...>
> u.posts
#=> []
> u.posts.build(title: "Some Title", content: "This is a post")
#=> #<Post ...>
> u.save
#=> true
> u.posts(reload: true)
#=> [#<Post ...>]
```

When the user is saved, the associated post that was built for that user
also gets saved to the database.

If the association is instead defined with the `autosave` option set to
false, then saving a record will not cause associated records to also be
saved. The associated records will need to be saved explicitly. Consider the
same example from above, but with `has_many posts, autosave: false`.

```ruby
> u = User.first
#=> #<User ...>
> u.posts
#=> []
> u.posts.build(title: "Some Title", content: "This is a post")
#=> #<Post ...>
> u.save
#=> true
> u.posts(reload: true)
#=> []
```

The post wasn't saved with the user and it wasn't saved explicitly, so it
isn't persisted to the database.
