# Create Union Type Of Nearly Identical Objects

Let's say I have a data layer that can return data in two nearly identical
shapes. Either shape has all of the same keys except one has an `_id` key and
the other has a `key` key. I want a Zod schema that can validate either of
these shapes and produce a union type.

Let's start with an intermediate Zod object that holds all possible keys.

```typescript
const intermediateObject = z.object({
  _id: z.string(),
  key: z.string(),
  name: z.string(),
  age: z.number()
  // any other shared keys
})
```

I can then manipulate this into the desired schema using
[`or()`](https://github.com/colinhacks/zod#unions) and
[`omit()`](https://github.com/colinhacks/zod#pickomit).

```typescript
const objectWithoutId = intermediateObject.omit({ _id: true })
const objectWithoutKey = intermediateObject.omit({ key: true })

const unionSchema = objectWithoutId.or(objectWithoutKey)
```

And this produces the schema and union type I was looking for:

```typescript
type Union = z.infer<typeof unionSchema>;
/*
type Union = {
    key: string;
    name: string;
    age: number;
} | {
    _id: string;
    name: string;
    age: number;
}
*/
```

[source](https://twitter.com/jbrancha/status/1572357904266850305)
