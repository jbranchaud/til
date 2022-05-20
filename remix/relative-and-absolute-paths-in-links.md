# Relative And Absolute Paths In Links

Remix has its own routing system built in. The directories and files that you
place under `app/routes` will all make up the routes of the app. Routes are
pages in the app. And pages are meant to be linked to.

Remix's `Link` component can handle both relative and absolute paths with the
`to` prop.

Here is a link with relative path.

```jsx
// app/routes/posts/index.tsx
import { Link } from "@remix-run/react";

export default function Posts() {
  return (
    <Link to="admin">
      Admin
    </Link>
  )
}
```

Because the `Link` is rendered within the `posts/` directory, the link will
point to `localhost:3000/posts/admin`.

And here is an absolute path.

```jsx
// app/routes/posts/index.tsx
import { Link } from "@remix-run/react";

export default function Posts() {
  return (
    <Link to="/admin">
      Admin
    </Link>
  )
}
```

Notice that the only change was putting a leading slash in front of `admin` in
the `to` prop. Just like Unix path names, that indicates that the path is an
absolute one, anchored to the root. It doesn't matter that it is in the
`/posts` directory. It will point to `localhost:3000/admin`.

[source](https://remix.run/docs/en/v1/tutorials/blog#nested-routing)
