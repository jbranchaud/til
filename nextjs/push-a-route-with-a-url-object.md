# Push A Route With A URL Object

There are two ways of using the Next.js router to transition to another route
using
[`push`](https://nextjs.org/docs/api-reference/next/router#with-url-object).

The first, and perhaps more common, is by passing it a string.

```javascript
router.push('/search?tag=react')
```

This is great for simple routes. When routes require query params, this can
lead to error-prone string interpolation. That's where the second way comes in.

The second is to use a [URL
Object](https://nextjs.org/docs/api-reference/next/router#with-url-object)
instead of a string.

```javascript
router.push({
  pathname: '/search',
  query: { tag: 'react' }
})
```

Here we are working with an object. I find objects a bit easier to work with,
than strings, when doing programmatic things. Especially when it comes to
adding and removing query params.
