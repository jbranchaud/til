# Type Narrowing With Similarly Shaped Objects

Let's say we have a type with several properties and a variable of that type.

```typescript
type User = {
  firstName: string
  lastName: string
  age: number
  email: string
}

const liz: User = {
  firstName: 'Liz',
  lastName: 'Lemon',
  age: 38,
  email: 'liz@example.com'
}
```

We can use variables of this type in _narrower_ contexts as long as the
properties that are present have aligning types.

For instance, we can pass a `User` to this `sendNewsletter` function. Even
though the types don't match exactly, the type of `sendNewsletter`'s parameter
is a subset of `User`.

```typescript
const sendNewsletter = ({
  firstName,
  email,
}: {
  firstName: string;
  email: string;
}) => {
  console.log(`Sending newsletter to ${firstName} at ${email}`);
};

sendNewsletter(liz);
// "Sending newsletter to Liz at liz@example.com"
```

This is a form of [_type
narrowing_](https://www.typescriptlang.org/docs/handbook/2/narrowing.html)
through [structural
subtyping](https://www.typescriptlang.org/docs/handbook/type-compatibility.html).
