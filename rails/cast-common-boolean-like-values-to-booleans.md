# Cast Common Boolean-Like Values To Booleans

Sometimes you have to deal with values that are supposed to represent booleans,
but they aren't actually boolean values (i.e. `"t"` instead of `true`). Rail's
`ActiveModel` has a helper for casting these common boolean-like values to
actual booleans.

```ruby
> ActiveModel::Type::Boolean.new.cast('f')
=> false
> ActiveModel::Type::Boolean.new.cast('t')
=> true
> ActiveModel::Type::Boolean.new.cast('true')
=> true
> ActiveModel::Type::Boolean.new.cast('FALSE')
=> false
> ActiveModel::Type::Boolean.new.cast(0)
=> false
> ActiveModel::Type::Boolean.new.cast(1)
=> true
> ActiveModel::Type::Boolean.new.cast(true)
=> true
> ActiveModel::Type::Boolean.new.cast(false)
=> false
```

This cast method gives you a handy way to handle all thsoe different cases.
This is available as of Rails 5+.
