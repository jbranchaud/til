# Filter ActiveModel Validation Errors

Now that `ActiveModel` has a custom `Errors` class (as of Rails 6.1) instead of
a hash, we get some useful functionality. Namely, we get a [`#where`
method](https://api.rubyonrails.org/classes/ActiveModel/Errors.html#method-i-where)
that allows us to filter errors based on the attribute name, type of
validation, and even properties of that validation.

Here I have created a new `Book` without any attributes. All of its validations
are going to fail and we are going to have an `ActiveModel::Errors` object
attached to it with several errors.

```ruby
> book = Book.new
=>
#<Book:0x00000001110397a8
...
> book.valid?
=> false
> book.errors
=> #<ActiveModel::Errors [#<ActiveModel::Error attribute=added_by, type=blank, options={:message=>:required, :if=>#<Proc:0x0000000110096260 /Users/jbranchaud/.asdf/installs/ruby/3.2.2/lib/ruby/gems/3.2.0/gems/activerecord-7.2.1/lib/active_record/associations/builder/belongs_to.rb:130 (lambda)>}>, #<ActiveModel::Error attribute=title, type=blank, options={}>, #<ActiveModel::Error attribute=title, type=too_short, options={:count=>3}>, #<ActiveModel::Error attribute=author, type=blank, options={}>, #<ActiveModel::Error attribute=publication_date, type=blank, options={}>]>
```

Let's say I want to check for a specific validation error. I can use `#where`
to filter down by attribute name (e.g. `:title`). I can filter even further by
including the validation type as well (e.g. `:too_short`).

```ruby
> book.errors.where(:title)
=>
[#<ActiveModel::Error attribute=title, type=blank, options={}>,
 #<ActiveModel::Error attribute=title, type=too_short, options={:count=>3}>]
> book.errors.where(:title, :too_short)
=> [#<ActiveModel::Error attribute=title, type=too_short, options={:count=>3}>]
> book.errors.where(:title, :too_short).first.message
=> "is too short (minimum is 3 characters)"
> book.errors.where(:title, :too_short).first.full_message
=> "Title is too short (minimum is 3 characters)"
```

This filtering could be used as part of conditional checks for what flash
message gets displayed to the user or even what route/view gets rendered in
response to the error.
