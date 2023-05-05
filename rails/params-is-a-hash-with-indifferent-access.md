# Params Is A Hash With Indifferent Access

When you have an instance of `ActionController::Parameters`—which you often do
with `params` in a Rails controller—under the hood you have a
`HashWithIndifferentAccess`.

Here is what the initializer looks like when you call
`ActionController::Parameters.new(some_hash)`.

```ruby
def initialize(parameters = {}, logging_context = {})
  @parameters = parameters.with_indifferent_access
  @logging_context = logging_context
  @permitted = self.class.permit_all_parameters
end
```

This means you can reference the keys in your parameters as either a _string_
key or a _symbol_ key.

```ruby
> params = ActionController::Parameters.new({ username: 'tacocat' })
=> #<ActionController::Parameters {"username"=>"tacocat"} permitted: false>
> params['username']
=> "tacocat"
> params[:username]
=> "tacocat"
```

Note that `ActiveSupport::HashWithIndifferentAccess` is not an ancestor of the
`ActionController::Parameters` class (like it once used to be), but is just how
the incoming hash is transformed when initialized.
