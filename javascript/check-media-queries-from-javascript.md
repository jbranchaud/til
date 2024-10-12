# Check Media Queries From JavaScript

I'm usually thinking about and [using media
queries](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_media_queries/Using_media_queries)
from a CSS context. I use them to control what styles are displayed for a
variety of scenarios, such as at different screen widths, when a user prefers
reduced motion, or when the user prefers a dark color scheme.

The current value of various media queries can be checked from a JavaScript
context as well.

For instance, if we want to see if the user prefers a _dark_ color schema, we
can look for a _match_ on that media query with
[`matchMedia`](https://developer.mozilla.org/en-US/docs/Web/API/Window/matchMedia).

```javascript
> window.matchMedia('(prefers-color-scheme: dark)')
MediaQueryList {media: '(prefers-color-scheme: dark)', matches: true, onchange: null}
> window.matchMedia('(prefers-color-scheme: dark)')['matches']
true
```

This queries for the [`prefers-color-scheme` media
feature](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme).

The [Astro.build Blog
Tutorial](https://docs.astro.build/en/tutorial/6-islands/2/#add-client-side-interactivity)
shows an example of using this to wire up a Light/Dark mode toggle.
