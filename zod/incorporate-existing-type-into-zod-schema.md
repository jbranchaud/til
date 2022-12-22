# Incorporate Existing Type Into Zod Schema

Zod's API is great for quickly scaffolding the shape of data that we're
working with. This breaks down when data has a more complex shape and is coming
from somewhere else, like a Prisma client. The shape of the data, and types
provided by the library, are determined somewhere else. We want to leverage
that rather than redefine it.

Fortunately, Zod has a way for us to incorporate an existing type into a Zod
schema that we're building.

```typescript
import {z} from 'zod'
import {Book} from '@prisma/client'

const BookOrder = z.object({
  customer: z.object({
    email: z.string().email(),
    name: z.string()
  }),
  books: // how do we use the `Book` type here?
})
```

We can turn the `Book` type into a Zod type that we can use in our schema with
`z.ZodType` and `z.any`.

```typescript
import {z} from 'zod'
import {Book} from '@prisma/client'

const BookSchema: z.ZodType<Book> = z.any()

const BookOrder = z.object({
  customer: z.object({
    email: z.string().email(),
    name: z.string()
  }),
  books: BookSchema.array()
})
```

We create a `BookSchema` with `z.any` and then narrow it to a `z.ZodType` with
our `Book` type.

[source](https://github.com/colinhacks/zod/issues/52#issuecomment-629897855)
