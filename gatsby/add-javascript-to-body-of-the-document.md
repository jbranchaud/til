# Add JavaScript To Body Of The Document

Sometimes your JavaScript script tag needs to be placed in the body of the
document. Like inside the `<body>` tag toward the bottom. With Gatsby you don't
have direct access to the outer HTML document without copying it out of the
cache.

And you don't need to copy it out of the cache. Gatsby offers an SSR
(server-side rendering) API for rendering content into various parts of the
document. Here is how we can use the
[`onRenderBody`](https://www.gatsbyjs.org/docs/ssr-apis/#onRenderBody) callback
to add a `<script>` tag to the end of the body.

```javascript
// gatsby-ssr.js
import React from "react"

export const onRenderBody = ({ setPostBodyComponents }) => {
  return setPostBodyComponents([
    <script src="https://some-3rd-party-script.js"></script>,
  ])
}
```

`onRenderBody` provides several functions including `setPostBodyComponents`.
This takes an array of React fragments that will be injected at the bottom of
the document body.

[source](https://github.com/gaearon/overreacted.io/pull/55/files)
