# Retrieve An Object If It Exists

Rails' Active Support provides the `blank?` and `present?` convenience
methods as extensions to many objects. It also extends the Object class by
providing the [`presence`](http://api.rubyonrails.org/classes/Object.html#method-i-presence)
method. This method returns the *receiver* if it is not blank, otherwise
it returns nil.

Instead of doing

```ruby
User.nickname.present? ? User.nickname : User.firstname
```

I can simply do

```ruby
User.nickname.presence || User.firstname
```
