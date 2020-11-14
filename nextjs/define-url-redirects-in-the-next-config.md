# Define URL Redirects In The Next Config

In [Add Web Server Layer Redirects](vercel/add-web-server-layer-redirects.md),
I explained how to define URL redirects to your [Vercel](https://vercel.com/)
configuration for a [Next.js](https://nextjs.org/) app. Because these redirect
rules are defined in `vercel.json` which is processed at the time of deployment
on the Vercel platform, you are unable to experience these redirects with your
local dev instance of the app. That could be misleading and cause confusion
during development.

Instead, you can define your redirects in `next.config.js` as part of the
Next.js app's configuration. When locally running the Next dev server, these
redirects will be processed and active.

Here is an example of these redirects in `next.config.js`:

```javascript
const nextConfig = {
  async redirects() {
    return [
      {
        source: "blog/old-blog-post-name",
        destination: "blog/new-blog-post-name",
        permanent: true,
      },
      {
        source: "/store",
        destination: "store.example.com"
        permanent: true,
      },
    ]
  },
}
```

These will be 308 Permanent Redirects because of `permanent: true`. You can
change that to `false` to make them into 307s.
