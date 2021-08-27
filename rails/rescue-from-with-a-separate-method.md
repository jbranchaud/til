# Rescue From With A Separate Method

In an earlier post on [`rescue_from`](rescue_from.md), I showed how you can
write an exception handler with a block argument.

If instead you'd prefer to implement the exception handler as a separate
method, you can do that by passing
[`rescue_from`](http://api.rubyonrails.org/classes/ActiveSupport/Rescuable/ClassMethods.html)
a `with` keyword argument. This too will behave as a catch-all for a particular
exception raised in your controller.

Here is what that can look like:

```ruby
class ApplicationController < ActionController::Base
  rescue_from User::NotAuthorized, with: :handle_unauthorized_user

  def index
    # ...
  end

  private

  def handle_unauthorized_user(exception)
    # respond with some Not Authorized page
  end
end
```

If the `User::NotAuthorized` exception bubbles up to the `rescue_from`, then it
will hand that exception off to the `handle_unauthorized_user` method. We can
include whatever logic and monitoring we want here and then render an
appropriate response.
