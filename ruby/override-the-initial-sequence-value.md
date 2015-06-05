# Override The Initial Sequence Value

[FactoryGirl sequences](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#sequences)
can be defined with an initial starting value

```ruby
FactoryGirl.define do
  sequence :email, 1000 do |n|
    "person#{n}@example.com"
  end
end
```

thus:

```ruby
> FactoryGirl.generate :email
=> "person1000@example.com"
> FactoryGirl.generate :email
=> "person1001@example.com"
```
