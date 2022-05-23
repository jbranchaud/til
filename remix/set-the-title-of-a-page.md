# Set The Title Of A Page

One of the reserved functions in a Remix route is `meta`. Defining this
function allows you to specify meta tags that appear in the `<head>` of a page,
including the `<title>` tag.

```
import type {
  MetaFunction,
  LoaderFunction
} from "@remix-run/node";

export const loader: LoaderFunction = async ({ params }) => {
  // load and return the post
};

export const meta: MetaFunction = ({ data }) => {
  const { title } = data?.posts || {}

  return {
    title: title || "An Article",
  };
};

export default function Post() {
  /* render the post */
}
```

The `meta` function returns an object that contains key-value pairs of meta
tags. We can include something like `title: 'Sign Up'` for a static title. Or
we can access things like `location`, `params`, and even `data` from the loader
to produce a content-specific title.

If open one of these `/posts/$slug` pages in the browser and crack open the
_View Source_, we'll be able to see the `<title>Name Of My Post</title>` tag
within the `<head>` tag.
