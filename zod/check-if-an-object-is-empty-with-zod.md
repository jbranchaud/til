# Check If An Object Is Empty With Zod

Zod is a schema validation library. It can be used to check all sorts of
properties about the data moving through our system.

Let's look at how to implement a common type of check -- is this object empty?

```javascript
import {z} from 'zod';

const emptyObjectSchema = z.object({}).strict();
const isEmpty = (obj: object): boolean => {
  const result = emptyObjectSchema.safeParse(obj);
  return result.success;
}

isEmpty({});
//=> true

isEmpty({ hello: 'world' });
//=> false
```

This `emptyObjectSchema` _strictly_ defines the schema as an empty object
(`{}`). Without the [`strict()`](https://github.com/colinhacks/zod#strict)
part, we'd be allowing an object with key-value pairs to quietly pass the
validation.

[source](https://twitter.com/jbrancha/status/1565728882082385920)
