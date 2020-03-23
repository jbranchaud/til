# Order Matters For `rescue_from` Blocks

In a Rails controller, you can declare any number of [`rescue_from`
blocks](https://api.rubyonrails.org/classes/ActiveSupport/Rescuable/ClassMethods.html)
for capturing and responding to execeptions that are raised by your
application.

```ruby
class BooksController < BaseController

  rescue_from ForbiddenAction do |e|
    render json: { error: e.message }.to_json, status: 403
  end

  rescue_from StandardError do |e|
    render json: { error: e.message }.to_json, status: 500
  end

  def index
    # ...

    raise ForbiddenAction, "Which rescue_from is this going to hit?"
  end
end
```

The potential problem with above is the ordering of the two `rescue_from`
blocks. Assume that `ForbiddenAction` is a subclass of the `StandardError`
class -- this is likely the case for exceptions you declare in your app. The
top `rescue_from` will never get hit because everything that subclasses
`StandardError` will be trapped by the bottom `rescue_from`.

These `rescue_from` blocks are applied bottom-up. That means you have to
consider the class hierarchy when structuring your code. In the above code
example, if we flip the two of them around, we will then get what we are
expecting.
