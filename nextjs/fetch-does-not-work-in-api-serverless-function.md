# Fetch Does Not Work In API Serverless Function

Next.js ships with [its own implementation of
`fetch`](https://nextjs.org/docs/app/api-reference/functions/fetch) that
extends the [native `fetch`
API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API).

I ran into a bug recently that was only reproducible in production. I had a
Next.js API function that was `POST`ing to another API endpoint using `fetch`.
I tested it several ways in development. It worked great. However, once the
feature was in production, it was silently failing. After some `console.log`
debugging, I discovered that the target API was getting an empty `body` in the
`POST` request.

I don't know the specifics of why, but somehow the `fetch` implementation
running in the Vercel serverless function environment apparently strips out the
`body` of a POST request.

The solution, for me, was to add the
[`node-fetch`](https://github.com/node-fetch/node-fetch) package and import
that version of fetch in my API function. Once I made that change, my feature
was working again.

[source](https://github.com/vercel/vercel/discussions/4971)
