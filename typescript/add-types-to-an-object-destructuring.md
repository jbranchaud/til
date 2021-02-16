# Add Types To An Object Destructuring

Let's say I'm building a form component that asks the user for their first name
and email address. I then want to submit these values to some server endpoint
to subscribe the user to a newsletter.

Now, what if I want to type the destructuring of the form values?

The standard syntax for doing this with TypeScript conflicts with the
destructured renaming ES6 feature:

```javascript
const { firstName: string, email: string } = formValues;
```

This won't work.

Rather than typing the individual values in the destructuring, you'll need to
type the destructured object itself.

```typescript
const {
  firstName,
  email,
}: { firstName: string; email: string } = formValues;
```

[source](https://flaviocopes.com/typescript-object-destructuring/)
