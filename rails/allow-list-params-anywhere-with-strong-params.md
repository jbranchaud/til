# Allow List Params Anywhere With Strong Params

The intended use of
[`StrongParams`](https://api.rubyonrails.org/classes/ActionController/StrongParameters.html)
is to prevent unintended params from getting through a controller action during
mass assignment.

This can be put to use other places in your Rails app, such as a service
object, where mass assignment is used to update records.

```ruby
class BookTitleUpdater
  ALLOW_LIST = [:title].freeze

  def self.run(data)
    params = ActionController::Parameters.new(data).permit(*ALLOW_LIST)

    Book.find(data[:id]).update!(params)
  end
end
```

This helps prevent other values from getting inadvertently updated on the `book` record.

```ruby
> ALLOW_LIST = [:title]
> data = { title: "Legacy Code", author_id: 22 }
> params = ActionController::Parameters.new(data).permit(*ALLOW_LIST)
> params.to_h
#=> { title: "Legacy Code" }
```

The `author_id` value is ignored and won't be passed to the `#update` call.
