# Markdown Files Are Of Type MarkdownInstance

One of the things Astro excels at is rendering markdown files as HTML pages in
your site. And at some point we'll want to access a listing of those markdown
files in order to do something like display a list of them on an index page.
For that, we'll use
[`Astro.glob()`](https://docs.astro.build/en/reference/api-reference/#astroglob).

```typescript
---
const allPosts = await Astro.glob("../posts/*.md");
---

<ul>
  {allPosts.map(post => {
    return <Post title={post.frontmatter.title} slug={post.frontmatter.slug} />
  })}
</ul>
```

This looks great, but we'll run into a type error on that first line:
`'allPosts' implicitly has type 'any'`. We need to declare the type
of these post instances that are being read-in by Astro.

These are of [type
`MarkdownInstance`](https://docs.astro.build/en/reference/api-reference/#markdown-files).
That's a generic though, so we need to tell it a bit more about the shape of a
post.

```typescript
import type { MarkdownInstance } from "astro";

export type BarePost = {
  layout: string;
  title: string;
  slug: string;
  tags: string[];
};

export type Post = MarkdownInstance<BarePost>;
```

We can then update that first line:

```typescript
const allPosts: Post[] = await Astro.glob("../posts/*.md");
```

Alternatively, you can specify the generic on `glob`:

```typescript
const allPosts = await Astro.glob<BarePost>("../posts/*.md");
```
