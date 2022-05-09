# Include Type Of Operation In Webhook Response

When setting up a webhook in Sanity Studio, you can specify what types of
operations you want to trigger the webhook: `create`, `update`, and `delete`.

If you include all three for a webhook, then you'll probably want to know in
your webhook handler which type of operation you're receiving.

Webhooks are run in _Delta Mode_ which means that a collection of GROQ
functions are available in the _filter_ and _projection_ blocks. These
functions include
[`delta::operation`](https://www.sanity.io/docs/groq-functions#a64594a50318).

Here is what a projection using `delta::operation` might look like:

```groq
{
  _id,
  firstName,
  lastName,
  email,
  'operation': delta::operation()
}
```

This function can resolve to either `create`, `update`, or `delete`.
