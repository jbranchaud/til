# Create Mock Class That Can Be Overridden

Let's say I've defined a `MockTwilioClient` class for my system tests so that
they don't have to actually make calls out to the Twilio API.

```ruby
class MockTwilioClient
  def send_sms_message
    "MSG_SID_123"
  end
end
```

Now, any test that is exercising behavior that uses those parts of the
`TwilioClient` can mock those calls in a predictable way.

The above class always is successful when `send_sms_message` is called. What if
we want to simulate an error response? We need a way to override the client for
specific testing scenarios.

Let's create a helper that can create `MockTwilioClient` instances, either as is
or with overrides.

```ruby
def create_mock_twilio_client(&block)
  if block_given?
    Class.new(MockTwilioClient, &block).new
  else
    MockTwilioClient.new
  end
end
```

If we pass it a block with specific method overrides, it will create a one-off
anonymous subclass of `MockTwilioClient` with that block which effectively
overrides the parent class's methods.

We can put this to use like so:

```ruby
require 'test_helper'

class SomeSystemTest < SystemTestCase
  class MockTwilioClient
    def send_sms_message
      "MSG_SID_123"
    end
  end

  def create_mock_twilio_client(&block)
    if block_given?
      Class.new(MockTwilioClient, &block).new
    else
      MockTwilioClient.new
    end
  end

  test "send message to customer" do
    mock_client = create_mock_twilio_client

    TwilioClient.stub(:new, mock_client) do
      # some action that uses `send_sms_message`
      
      # some assertions ...
    end
  end

  test "fail to send message to customer" do
    mock_client = create_mock_twilio_client do
      def send_sms_message
        raise "Failed to send message"
      end
    end

    TwilioClient.stub(:new, mock_client) do
      # some action that uses `send_sms_message`
      
      # some assertions ...
    end
  end
end
```

In the second test case, I override the _success path_ with a version of
`send_sms_message` that raises an error.
