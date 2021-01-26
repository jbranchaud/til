# Set The Type For A useState Hook

TypeScript can often infer the type of a `useState` hook. For instance, in the following example, TypeScript infers a type of `boolean`:

```typescript
const [open, setOpen] = React.useState(false);
```

If we have a `useState` hook that can be `null` or a string:

```typescript
const [error, setError] = React.useState(null);

setError('There was an error');
// Argument of type 'string' is not assignable
// to parameter of type 'SetStateAction<null>'
```

then we'll get a TypeScript warning when we violate the inferred type of
`SetStateAction<null>`.

The `useState` can be appropriate typed for this situation like so:

```typescript
const [error, setError] =
  React.useState<null | string>(null);
```

[source](https://www.carlrippon.com/typed-usestate-with-typescript/)
