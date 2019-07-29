# Expect A Method To Be Called And Actually Call It

You can assert that a method is called without actually executing it. This is
often what `expect(...).to receive(:method_name)`  is used for. If you do want
that method called, RSpec can accommodate you.

Let's say we have the following two classes:

```ruby
class Greeting
  def self.say_hello
    raise "Don't actually execute this"
    puts "Hello"
  end
end

class GreetingService
  def self.run
    Greeting.say_hello
  end
end
```

We can assert that `say_hello` gets called without actually raising the
exception (first `it` block). If we tack on `and_call_original` then RSpec will
make the assertion and execute the method (second `it` block).

```ruby
describe "expect and call original" do
  it "expect the message is received" do
    expect(Greeting).to receive(:say_hello)
    GreetingService.run
    # passes
  end

  it "expect and call original" do
    expect(Greeting).to receive(:say_hello).and_call_original
    GreetingService.run
    # fails, RuntimeError
  end
end
```

[source](https://relishapp.com/rspec/rspec-mocks/v/2-14/docs/message-expectations/calling-the-original-method)
