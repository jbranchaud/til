# Access Secrets In A Rails 5.2 App

For a long time the access chain for getting at secrets in your Rails app
stayed the same. For instance, getting at the `secret_key_base` value looked
something like this:

```ruby
Rails.application.secrets.secret_key_base
```

In the world of Rails 5.2, secrets are no longer secrets. They are now
credentials. This means they are under the `credentials` key instead of the
`secrets` key. Here is how you can access `secret_key_base` now:

```ruby
Rails.application.credentials.secret_key_base
```

[source](https://www.engineyard.com/blog/rails-encrypted-credentials-on-rails-5.2)
