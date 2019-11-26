# Test If An Instance Variable Was Assigned

When testing Rails controller actions, you'll often be making assertions about
the response to your test request. You may also want to assert about the
instance variables being set, as those are headed for your view layer.

For instance, if an instance variable `@metadata` is supposed to be set in a
`#show` controller action, you can assert that it is with [RSpec's
`assigns`](https://relishapp.com/rspec/rspec-rails/docs/controller-specs):

```ruby
describe "when given valid params" do
  it "sets the metadata" do
    get :show, params: valid_params

    expect(assigns(:metadata)).to match(
      identifier: "abc123",
      session_id: "fe98f08c-bf2f-4749-9f81-071d9cc7720e",
    )
  end
end
```

[source](https://stackoverflow.com/questions/2051373/how-to-test-instance-variable-was-instantiated-in-controller-with-rspec)
