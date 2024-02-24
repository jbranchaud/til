# Set Path Alias For Cleaner Imports

In the `tsconfig.json` file of a TypeScript project, there are a bunch of
compiler options that you can specify. One of those compiler options is
`paths`. This is an object that can map path aliases to directories in your
project.

In projects where nested files are importing modules from other parts of the
file tree, you can end up with cluttered imports like this:

```typescript
import { prisma } from '../../server/db.server'
import { List } from '../../components/list'
```

By setting a path alias in your `tsconfig.json` file, like so, you can tidy
these up:

```json
{
  "compilerOptions": {
    "paths": {
      "~/*": ["./app/*"]
    }
  }
}
```

Now I can write any import such that it anchors to the `app` directory with
`~`.

```typescript
import { prisma } from '~/server/db.server'
import { List } from '~/components/list'
```

I prefer a single path alias if I can get away with it, but you can [add
several](https://learn.saleor.io/setup/typescript-path-aliases/) to suit your
project if you'd like.

[source](https://www.typescriptlang.org/tsconfig#paths)
