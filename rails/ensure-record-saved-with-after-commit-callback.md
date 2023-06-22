# Ensure Record Saved With after_commit Callback

In my experience, some of the more common `ActiveRecord` callbacks are ones
like `before_save` or `after_update`. While working with some code, where I
needed to send a notification when a certain value was updated, I learned that
something like `after_update` wasn't sufficient.

If my record is updated within a transaction, the `after_update` will get
triggered even though the changes could later get rolled back resulting in me
erroneously sending the notification.

```ruby
ActiveRecord::Base.transaction do
  user.update(interesting_value: 123)

  do_something # <-- rollback could happen here!
end
```

To ensure I'm not over-eager with my notifications, I should instead use
[`after_commit`](https://api.rubyonrails.org/v7.0.5/classes/ActiveRecord/Transactions/ClassMethods.html#method-i-after_commit)
which only gets called after the changes have been committed to the database.

```ruby
class User < ApplicationRecord
  after_commit :send_notification,
    on: [:create, :update],
    if: :interesting_value_was_changed?

  # rest of class...

  private

  def send_notification
    # logic...
  end

  def interesting_value_was_changed?
    # logic...
  end
end
```

On either `create` or `update` if my condition is met, then after the _commit_
goes through, the `#send_notification` method will be triggered.
