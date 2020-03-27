# Schedule Sidekiq Jobs Out Into The Future

The most common way to schedule a [Sidekiq](https://github.com/mperham/sidekiq)
job is with the `perform_async` method. That will queue up your job so that it
is worked as soon as possible.  That may not also be desired. Sometimes you
want a bit more say in when jobs are run.

The `perform_in` and `perform_at` methods can help with scheduling jobs out
into the future.

With `perform_in` we can say how much time from now would be the soonest that
we'd like the job performed.

```ruby
MyWorker.perform_in(10.minutes, arg1, arg2)
```

We can do the same thing with `perform_at`.

```ruby
MyWorker.perform_at(10.minutes.from_now, arg1, arg2)
```

Or we can schedule something out for a specific point in time in the future.

```ruby
MyWorker.perform_at(Date.today.end_of_week, arg1, arg2)
```

[source](https://github.com/mperham/sidekiq/wiki/Scheduled-Jobs)
