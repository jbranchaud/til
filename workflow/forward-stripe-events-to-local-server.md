# Forward Stripe Events To Local Server

Stripe offers a robust test mode for developing and testing your app with a
payments sandbox.

The [Stripe CLI](https://stripe.com/docs/stripe-cli/webhooks#forward-events)
has a `listen` command that can be used to foward any and all Stripe events
from the test account to a locally running server.

Assuming you've installed the `stripe` CLI, you can run a command like the
following to forward all events to your local server.

```bash
$ stripe listen --forward-to localhost:5000/hooks
```

While this is running you'll see incoming events and your servers outgoing
responses.

If you'd like to filter down to receive specific events, you can use the
[`--events`
flag](https://stripe.com/docs/stripe-cli/webhooks#supported-events).
