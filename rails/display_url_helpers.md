#Display url helpers in console

First add a brake at the moment when you want to display a link like in a controller with pry for example.

Then add
```ruby
include Rails.application.routes.url_helpers
```

Then you can do

```ruby
link_to 'Home', root_url
```

or

```ruby
url_for controller: :users, only_path: true
users_path
```

Don't forget rake routes also...
