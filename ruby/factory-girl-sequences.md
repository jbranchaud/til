# FactoryGirl Sequences

[FactoryGirl sequences](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#sequences)
are often used inline for unique values such as emails:

```ruby
factory :user do
  sequence(:email) { |n| "person#{n}@example.com" }
end
```

However, a sequence can be defined on its own

```ruby
FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end
```

That means it can be invoked outside the context of a factory

```ruby
> FactoryGirl.generate :email
=> "person1@example.com"
> FactoryGirl.generate :email
=> "person2@example.com"
```

Or it can be used as a shared sequence across multiple factories

```ruby
factory :customer do
  ...
  email
end

factory :admin do
  ...
  email
end
```
