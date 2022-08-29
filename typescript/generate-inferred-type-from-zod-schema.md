# Generate Inferred Type From Zod Schema

One of the killer features of [`Zod`](https://github.com/colinhacks/zod) is
that it does double-duty. When you define a schema, you can use that for
runtime checks. You can also generate an inferred type from that schema for
static type checking.

Let's say I have the following schema defined for data representing a
_contact_.

```typescript
import {z} from 'zod'

const contactSchema = z.object({
  person: z.object({
    firstName: z.string(),
    lastName: z.string()
  }),
  email: z.string().email(),
})
```

I can use this schema along with Zod's
[`z.infer()`](https://github.com/colinhacks/zod#type-inference) function to
generate a type that I can use throughout my codebase.

```typescript
const createContact = (data: z.infer<typeof contactSchema>) => {
  // ...
}
```

If I inspect data, I can see that I get an object type generated from the
`contactSchema`.

```typescript
/* data: {
 *    person: {
 *        firstName: string;
 *        lastName: string;
 *    };
 *    email: string;
 * }
 */
```

That works, but looks a bit cluttered. I could pull it out into a defined type.
One that could even be exported if I was so inclined.

```typescript
export type Contact = z.infer<typeof contactSchema>

const createContact = (data: Contact) => {
  // ...
}
```
