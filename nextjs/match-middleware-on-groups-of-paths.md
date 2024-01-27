# Match Middleware On Groups Of Paths

The Next.js middleware takes an array of path matchers in its config to decide
what pages to apply middleware to. These paths can use regex via
[`path-to-regexp`](https://github.com/pillarjs/path-to-regexp#path-to-regexp-1).

Let's say I'm using middleware to do authentication checks for certain pages.

If I want to visits to my `/dashboard` page to run through middleware, I can
configure my matcher like so:

```javascript
export const config = { matcher: ["/dashboard"] };
```

If we want to match against `/dashboard` and any possible sub-structure to that
path, we can apply some regex:

```javascript
export const config = { matcher: ["/dashboard/:all*"] };
```

That will match `/dashboard`, `/dashboard/hello`, `dashboard/hello/world`, etc.

Lastly, let's say I only want to match routes under the `/dashboard` route. I
can replace the `*` (zero-or-more matches) with a `+` (one-or-more matches):

```javascript
export const config = { matcher: ["/dashboard/:all+"] };
```

That will match `/dashboard/hello`, `/dashboard/hello/world`, etc., but not
`/dashboard`.

[source](https://nextjs.org/docs/app/building-your-application/routing/middleware)
