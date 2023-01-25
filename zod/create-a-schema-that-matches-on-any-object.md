# Create A Schema That Matches On Any Object

Typically when creating an object schema with Zod, you have to specify the keys
and their types that make up the object.

```typescript
import {z} from 'zod'

const objectSchema = z.object({ id: z.string() })

const obj = objectSchema.parse({ id: 1, type: 'user' })
//=> { id: 1 }

objectSchema.parse({ _id: 1, _type: 'user' })
//=> ZodError
```

If, however, you want a generic object schema that is ostensibly only checking
that the thing is an object and then allows any and all key-value pairs, you
can use the [`passthrough()`](https://github.com/colinhacks/zod#passthrough)
function.

```typescript
import {z} from 'zod'

const anyObjectSchema = z.object({}).passthrough()

const obj = anyObjectSchema.parse({ id: 1, type: 'user' })
//=> { id: 1, type: 'user' }
```
