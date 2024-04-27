# Ensure Lookup Can Be Retried

A common thing to do in a workflow step is to look up a record. This might be a
record that was created or updated around the time that the workflow was
triggered.

You need to be sure the record was found before proceeding. That might end up
looking like this:

```typescript
export default inngest.createFunction(
  { id: "record-user-purchase" },
  { event: "app/record.purchase" },
  async ({ event, step }) => {
    const checkoutSession =
      await step.run("find checkout session", async () => {
        const cs = provider.lookupSession(event.checkoutSessionId)

        return cs;
      });

    if(!checkoutSession) {
      throw new Error('Checkout session not found')
    }
  }
);
```

This approach has a subtle problem which is that the error for a missing
checkout session is raised _outside_ the step that sets `checkoutSession`. As
inngest does a series of retries, the memorized `checkoutSession` step won't be
rerun and the error will continue to be thrown.

It is better to raise the error _within_ the lookup step:

```typescript
export default inngest.createFunction(
  { id: "record-user-purchase" },
  { event: "app/record.purchase" },
  async ({ event, step }) => {
    const checkoutSession =
      await step.run("find checkout session", async () => {
        const cs = provider.lookupSession(event.checkoutSessionId)

        if(!cs) {
          throw new Error('Checkout session not found')
        }

        return cs;
      });
  }
);
```

If the checkout session is missing on the first couple tries, the step will
have a chance to retry the lookup and maybe eventually find what it is looking
for.
