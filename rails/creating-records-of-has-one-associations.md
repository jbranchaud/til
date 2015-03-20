# Creating Records of Has_One Associations

When working with a model, say a User, that has a `has_many` association
with another model, say a Post, you can create a new post for a user like
so:

```ruby
u1 = User.first
=> #<User:0x...>
u1.posts.create(title: "Some Title", content: "...")
=> #<Post:0x...>
```

What about with a `has_one` association? Consider a Customer that has a
`has_one` association with an Account. Rails provides this method for you:

```ruby
c1.create_account(account_number: 123, ...)
=> #<Account:0x...>
```

Rails also gives you a similar `build` method:

```ruby
c1.build_account(account_number: 123, ...)
=> #<Account:0x...>
```
