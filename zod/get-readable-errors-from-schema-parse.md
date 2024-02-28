# Get Readable Errors From Schema Parse

Let's say we have the following schema for validating the data used to create a
new post record:

```typescript
const NewPostSchema = z.object({
  title: z.string().min(1, "Title is required"),
  slug: z.string().min(1, "Slug is required"),
  markdown: z.string().min(1, "Markdown is required"),
});
```

When we (safe) parse some incoming user input with that schema and, for
example, one of the fields is empty, then the validation will fail and we'll
get some errors.

```typescript
const result = NewPostSchema.safeParse(userInput)

if(!result.success) {
  result.error;
  // ZodError: [
  //   {
  //     "code": "too_small",
  //     "minimum": 1,
  //     "type": "string",
  //     "inclusive": true,
  //     "exact": false,
  //     "message": "Slug is required",
  //     "path": [
  //       "slug"
  //     ]
  //   }
  // ]
}
```

That packs a lot of information. But if we are just trying to get something
minimal and actionable we can show to a user, we might want to flatten the
errors:

```typescript
const result = NewPostSchema.safeParse(userInput)

if(!result.success) {
  result.error.flatten().fieldErrors;
  // { slug: [ 'Slug is required' ] }
}
```

[source](https://github.com/colinhacks/zod/blob/master/ERROR_HANDLING.md#flattening-errors)
