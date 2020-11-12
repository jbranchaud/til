# Add Web Server Layer Redirects

People create links and bookmark URLs. Content, for a variety of reasons, has
to move from one place to another. For everyone's sake, you don't want to break
the URLs that people have come to rely on.

You need to setup some
[redirects](https://vercel.com/docs/configuration#project/redirects).

Though a [Next.js](https://nextjs.org/) app is just frontend code, when
distributed through [Vercel](https://vercel.com/), you can include some
configuration of the web server layer.

Add the `vercel.json` file to the top-level directory of your Next.js project
and then include any needed redirect rules.

```json
{
  "redirects": [
    {
      "source": "blog/old-blog-post-name",
      "destination": "blog/new-blog-post-name"
    },
    {
      "source": "/store",
      "destination": "store.example.com"
    }
  ]
}
```

In the first rule, one path is redirected to another for the same domain. In
the second rule, the path is redirected to an external URL.

By default, these redirects get a [308 status
code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/308).
