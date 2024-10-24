# Add Subscriber To Kit Form Via API

Because the Kit API is a bit sparse in words, I found it difficult to figure
out exactly what I needed to do to add a subscriber via a custom form. After
some experimenting and reading through [Course
Builder](https://github.com/badass-courses/course-builder/blob/main/packages/core/src/providers/convertkit.ts)
code, I was able to figure out that with the Kit v4 API there are two separate
calls that need to be made.

First, you need to create an `inactive` subscriber with the user's email (and
first name if given) via the [Create a subscriber
endpoint](https://developers.kit.com/v4#create-a-subscriber).

```typescript
async function createSubscriber(
  data: SubscriberData,
  apiKey: string,
): Promise<Response> {
  return fetch('https://api.convertkit.com/v4/subscribers', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Kit-Api-Key': apiKey,
    },
    body: JSON.stringify({
      email_address: data.email,
      first_name: data.name,
      state: 'inactive',
    }),
  })
}
```

Since this subscriber is `inactive`, they won't show up in the Kit dashboard,
but a subscriber record of them has been created.

Second, you need to add the subscriber to something, like a form or a sequence.
In my case, I had already created a form via the Kit dashboard, so I grab that
_Form ID_ and stick it in my `.env`. That way I am able to [add the subscriber
to the form by email
address](https://developers.kit.com/v4#add-subscriber-to-form-by-email-address).

```typescript
async function addSubscriberToForm(
  email: string,
  apiKey: string,
  formId: string,
): Promise<Response> {
  const url = `https://api.convertkit.com/v4/forms/${formId}/subscribers`
  return fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Kit-Api-Key': apiKey,
    },
    body: JSON.stringify({ email_address: email }),
  })
}
```

This will send a confirmation email to the email address. Once the person has
opened the email and hit 'Confirm', their corresponding `subscriber` record
will be marked as `active` and they will be added to the list of subscribers
for that form.
