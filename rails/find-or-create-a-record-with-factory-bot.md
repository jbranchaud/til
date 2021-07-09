# Find Or Create A Record With FactoryBot

I have a bunch of tests throughout my test suite that rely on a particular kind
of unique record. Let's say it is a special admin user.

```ruby
admin = FactoryBot.create(:user, email: 'admin@company.com')
```

If this user has already been created then trying to re-create it with
[FactoryBot](https://github.com/thoughtbot/factory_bot) will result in a unique
email validation error.

Another way to approach this would be to either find or create the admin user.
In some standard Rails code that might look like this:

```ruby
admin =
  User.find_by(email: 'admin@company.com') ||
  FactoryBot.create(:user, email: 'admin@company.com')
```

There is some repetitiveness to this that I'd like to avoid. FactoryBot doesn't
have an equivalent to ActiveRecord's `find_and_create_by`, but we can work
around this.

We can add an `initialize_with` directive to the `User` factory.

```ruby
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| 'user#{n}@example.com' }

    # a bunch of other attributes

    initialize_with { User.find_or_create_by(email: email) }
  end
end
```

With this in place, we can call `FactoryBot.create` with the already existing
_admin_ user and it will look up the record instead of raising a validation
error.

[source](https://stackoverflow.com/a/11799674/535590)
