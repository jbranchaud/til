# Make ActionMailer Synchronous In Test

When you set up an `ActionMailer` email, the default configuration is for it
to use `ActiveJob` to send the emails. [As of Rails 5, it will do so
asynchronously.](https://blog.bigbinary.com/2016/03/29/rails-5-changed-default-active-job-adapter-to-async.html).
Depending on your preferences for testing emails, you may prefer `ActiveJob`
to send the emails synchronously. This can be done by changing the
`queue_adapter` back to `:inline` in your `config/environments/test.rb`.

```ruby
config.active_job.queue_adapter = :inline
```

If you also configure the `delivery_method` as `:test`:

```ruby
config.action_mailer.delivery_method = :test
```

then emails will be queued up in `ActionMailer::Base.deliveries` allowing
you to write a test like this:

```ruby
expect(ActionMailer::Base.deliveries.count).to eq(1)
```

Check out [the
docs](https://guides.rubyonrails.org/action_mailer_basics.html) for more on
`ActionMailer`.

[source](https://stackoverflow.com/a/42987726/535590)
