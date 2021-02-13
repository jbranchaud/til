# Specify New Attributes For #find_or_create_by

The ActiveRecord
[`#find_or_create_by`](https://apidock.com/rails/v4.0.2/ActiveRecord/Relation/find_or_create_by)
method is a handy way to get an object that represents a record. It will
attempt to look up that record, usually based on a unique value or set of
values. If it can find one, then that's the record you get. If nothing is
found, then it will create a new record.

New records tend to need more data than just the unique lookup attribute. There
are a couple ways these other attributes can be specified.

The first is by giving `#find_or_create_by` a block.

```ruby
User.find_or_create_by(email: "some@email.com") do |new_user|
  new_user.admin = false
  new_user.password = params[:password]
  new_user.password_confirm = params[:password_confirm]
end
```

Another approach is to precede the `#find_or_create_by` call with a
[`#create_with`](https://apidock.com/rails/ActiveRecord/QueryMethods/create_with)
call.


```ruby
User.create_with(
  admin: false,
  password: params[:password],
  password_confirm: params[:password_confirm]
).find_or_create_by(email: "some@email.com")
```

In both cases, the extra attributes will not be applied to the `User` record in
the case of a _find_; they are only used in the case of a _create_.
