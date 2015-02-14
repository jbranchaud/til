# Limit Split

I've only ever used Ruby's
[`String#split`](http://ruby-doc.org//core-2.2.0/String.html#method-i-split)
with the delimiter argument (e.g. `"this string has spaces".split(" ")`).
However, this method has another argument you can specify; the `limit`
argument. With `limit`, you can *limit* the number of times that the split
happens.

```ruby
"this string has many spaces".split(" ")
# => ["this", "string", "has", "many", "spaces"]
"this string has many spaces".split(" ", 3)
# => ["this", "string", "has many spaces"]
```

There are surely many use cases, but one that stands out (from [The Rails 4
Way](https://leanpub.com/tr4w)) is for splitting a name into *first* and
*last* names.

```ruby
"Josh Branchaud".split(" ", 2)
# => ["Josh", "Branchaud"]
"David Heinemeier Hansson".split(" ", 2)
# => ["David", "Heinemeier Hansson"]
```

This really simplifies the code that is needed to make the following example
work:

```ruby
def create_user(name)
  user = User.new
  user.first_name, user.last_name = name.split(" ", 2)
  user.save
end
```
