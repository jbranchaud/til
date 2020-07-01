# Check If ActiveRecord Update Fails

There are two ways to update an `ActiveRecord` instance (not to mention
[`assign_attributes`](https://api.rubyonrails.org/classes/ActiveModel/AttributeAssignment.html),
[`update_attribute`](https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update_attribute),
etc.).

You can call
[`update`](https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update)
and
[`update!`](https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update-21).
If the updates would make the record invalid based on the model's validations,
then the update will fail.

You can tell if `update` failed because it will return `false` (instead of
`true`).

```ruby
unless book.update(book_params)
  log_book_update_failed(id: book.id)
end
```

The `update!` version will raise an `ActiveRecord::ActiveRecordError`
exception if the update fails.

```ruby
begin
  book.update!(book_params)
rescue ActiveRecord::ActiveRecordError
  log_book_update_failed(id: book.id)
end
```
