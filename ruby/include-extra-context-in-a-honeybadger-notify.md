# Include Extra Context In A Honeybadger Notify

The simplest way to `notify` [Honeybadger](https://www.honeybadger.io/) of an
error is to either pass it the exception directly:

```ruby
rescue SpecializedError => e
  Honeybadger.notify(e)
end
```

Or to give it a custom message:

```ruby
Honeybadger.notify("The user #{user.id} was unable to access their account.")
```

Honeybadger collects a lot of additional context about the report based on
where it is called. More context is usually better though. You can pass
additional, specific context with the `context` keyword argument.

```ruby
message = "The user was unable to access their account."
Honeybadger.notify(
  message,
  context: { user_id: user.id, query: params[:query] }
)
```

Include whatever else you might want to know and those values will show up in
the Honeybadger web interface.

[source](https://docs.honeybadger.io/lib/ruby/getting-started/reporting-errors/)
