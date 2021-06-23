# Test If deliver_later Is Called For A Mailer

There are many ways to test in your controller whether emails are going out. A
concise and quick way to check is just to see if a `deliver_later` happened.

Depending on how your test environment is configured, this could look one of
two ways.

If you have your `queue_adapter` set to
[`:inline`](https://api.rubyonrails.org/classes/ActiveJob/QueueAdapters/InlineAdapter.html),
then a `deliver_later` will happen synchronously. So, the email will
immediately end up in the `deliveries` box.

```ruby
expect {
  post :password_reset, params: valid_params
}.to change { ActionMailer::Base.deliveries.count }.by(1)
```

The behavior is a bit different if your `queue_adapter` is set to something
like
[`:test`](https://api.rubyonrails.org/classes/ActiveJob/QueueAdapters/TestAdapter.html).
In this case, the email is going to be queued in the app's job queue. Since it
is not immediately being sent, the expectation will have to be about the job
queue instead.

```ruby
expect {
  post :password_reset, params: valid_params
}.to have_enqueued_job(ActionMailer::DeliveryJob)
```

We can even dig into more specifics like this:

```ruby
expect {
  post :password_reset, params: valid_params
}.to have_enqueued_job(ActionMailer::DeliveryJob)
  .with('UserMailer', 'password_reset', 'deliver_later', Integer)
```
