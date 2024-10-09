# Define The Root Path For The App

The `root_path` helper that you might want to use in Rails controllers and
views is not available by default.

```ruby
> Rails.application.routes.url_helpers.root_path

ruby/3.2.2/lib/ruby/gems/3.2.0/gems/irb-1.14.0/lib/irb.rb:1285:in `full_message': undefined method `root_path' for #<Module:0x0000000106d11738> (NoMethodError)

Rails.application.routes.url_helpers.root_path
                                    ^^^^^^^^^^
Did you mean?  logout_path
               book_path
```

It needs to be declared in the `config/routes.rb` file with the controller
action that it points to.

```ruby
# config/routes.rb
Rails.application.routes.draw do
  root 'home#index'
end
```

Once this is defined the `root_path` will now be available with the rest of
your URL helpers.

```ruby
better-reads(dev)> reload!
Reloading...
better-reads(dev)> Rails.application.routes.url_helpers.root_path
=> "/"
```

[source](https://guides.rubyonrails.org/routing.html#using-root)
