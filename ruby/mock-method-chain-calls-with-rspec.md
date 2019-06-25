# Mock Method Chain Calls With RSpec

Generally with RSpec you mock one method call at a time:

```ruby
allow(User).to receive(:new).and_return(true)
```

Sometimes you are dealing with code that involves a chain of method calls.

```ruby
User
  .new
  .approve
  .send_welcome_email
```

If it becomes unreasonable to mock out each individual method, you can instead
mock out the chain of calls.

```ruby
allow(User).to receive_message_chain('new.approve.send_welcome_email')
```

Alternatively, you can write this as:

```ruby
allow(User).to receive_message_chain(:new, :approve, :send_welcome_email)
```

[source](https://relishapp.com/rspec/rspec-mocks/docs/working-with-legacy-code/message-chains)
