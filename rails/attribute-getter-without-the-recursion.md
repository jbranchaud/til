# Attribute Getter without the Recursion

You may find yourself adding a custom *getter* method for one of the
attributes in a Rails model. It might look something like this:

```ruby
def name
  name || account.name
end
```

This method will fall on its face as it quickly expands the stack
recursively calling itself. Instead, you can tell `ActiveRecord` that you
want the value of that attribute without invoking the getter
Instead, we want to get the value of the attribute without invoking the
model's getter. `ActiveRecord` allows us to do this with the
[`read_attribute`](http://api.rubyonrails.org/classes/ActiveRecord/AttributeMethods/Read.html#method-i-read_attribute)
method. Check it out:

```ruby
def name
  read_attribute(:name) || account.name
end
```

[source](http://stackoverflow.com/questions/21835116/overwrite-getter-activerecord-model-rails)
