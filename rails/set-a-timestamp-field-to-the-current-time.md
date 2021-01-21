# Set A Timestamp Field To The Current Time

To set a timestamp field to the current time, you could reach for the `#update`
method like you would when modifying any other field.

```ruby
MagicLink
  .find_by(token: some_token)
  .update(used_at: Time.zone.now)
```

This works, but it's more verbose than is necessary and requires that you
construct the right timestamp for _now_ (time zones and all).

Rails has a more concise and idomatic way of doing this:
[`#touch`](https://api.rubyonrails.org/v6.1.0/classes/ActiveRecord/Persistence.html#method-i-touch).

```ruby
MagicLink
  .find_by(token: some_token)
  .touch(:used_at)
```

Updating a timestamp to the current time is a common action in web
applications, so Rails offers the `#touch` method as a shorthand for doing it.
This will set the given field, in this case `:used_at`, to the current time.
This will also set the `updated_at/on` field.
