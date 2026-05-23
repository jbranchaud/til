# Halt ActionMailer Delivery With Callback

`ActionMailer` supports callbacks, similar to `ActiveRecord`, like
`before_deliver` and `after_delivery`. We can hook into the `before_deliver`
callback to interrupt the delivery of an email that shouldn't go out.

Here's the scenario: you schedule a bunch of payment reminders to go out to your
customers that still need to make their latest payment. Let's say the daily job
that schedules all of these reminders runs in the middle of the night, but
schedules the emails to land in inboxes at a more reasonable time, like 10am.
Between the time that the email is scheduled and it gets processed for delivery,
a customer makes their payment. In that case, we no longer want to send that
person an email reminder.

To handle this scenario, we can have a `before_deliver` callback that checks the
user's balance and raises `:abort` to halt the callback execution chain,
effectively preventing the email from going out. We can even scope the callback
to just the actions we care about using the `if` option and checking the
`action_name`.

```ruby
class UserMailer < ApplicationMailer
  before_deliver :abort_if_payment_is_current,
    if: -> { action_name.in?(%w[payment_reminder past_due_invoice]) }

  def payment_reminder
    # ...
  end

  def past_due_invoice
    # ...
  end

  private

  def abort_if_payment_is_current
    if @user.check_latest_balance.zero?
      raise :abort
    end
  end
end
```

See [Action Mailer
Callbacks](https://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-callbacks)
for more details.
