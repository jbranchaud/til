# Rescue From

The
[`rescue_from`](http://api.rubyonrails.org/classes/ActiveSupport/Rescuable/ClassMethods.html)
method, provided by `ActiveSupport`, is a handy way to provide a catch-all
response to a particular exception in Rails controllers.

For instance, if many of the controllers in your application raise a
`User::NotAuthorized` error for unauthorized requests, the
`ApplicationController` can provide a unified response. This will help dry
up your controllers and prevent any potential inconsistencies.

```ruby
class ApplicationController < ActionController::Base
  rescue_from User::NotAuthorized do |exception|
    # respond with some Not Authorized page
  end

  ...
end
```
