# Generate Types For A Content Collection

Let's say I'm using Astro to publish posts via markdown. One of the best ways
to do that is as a _Content Collection_. The posts will live in `src/content`
probably under a `posts` directory. Plus a config file will define the
collection and specify validations for the frontmatter.

```typescript
// src/content/config.ts
import { defineCollection, z } from 'astro:content';

const postsCollection = defineCollection({
  schema: z.object({
    title: z.string(),
    description: z.string(),
    tags: z.array(z.string())
  })
});

export const collections = {
  'posts': postsCollection,
};
```

When I first add this to my project and get the collection, it won't know what
the types are.

```astro
---
import { getCollection } from "astro:content";

export async function getStaticPaths() {
  const blogEntries = await getCollection("posts");
  //    ^^^ any

  return blogEntries.map((entry) => ({
    params: { slug: entry.slug },
    props: { entry },
  }));
}
---
```

I can tell Astro to generate a fresh set of types for things like content
collections by running the [`astro sync`
command](https://docs.astro.build/en/reference/cli-reference/#astro-sync).

```bash
$ npm run astro sync
```

This updates auto-generated files under the `.astro` directory which get pulled
in to your project's `env.d.ts` file.

All of these types will also be synced anytime I run `astro dev`, `astro
build`, or `astro check`.
