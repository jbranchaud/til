# Allow Cross-Origin Requests To Include Cookies

When making a cross-origin fetch request from a client (e.g. browser) to a
server, all kinds of CORS protections are enforced by the browser. One of those
protections, by default, is to avoid XSS attacks by not sending credentials
(e.g. cookies, authorization headers or TLS client certificates) in the request
or expose credentials to the client JavaScript code.

This is controlled by the
[Access-Control-Allow-Credentials](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Credentials)
header.

If we want to include things like cookies in the request, then we need to have
both the client-originating request and the server to agree to allow
credentials.

The client-side fetch will need to specify that credentials should be included:

```javascript
fetch(url, {
  credentials: 'include'
})
```

The server, either in response to a GET or a preflight request, will need to do
two things. First, the response headers need to have
`Access-Control-Allow-Credentials` set to `true`. Second, the
[`Access-Control-Allow-Origin`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin)
will need to name the specific origin (the client). In other words, the allowed
origin cannot be set to `*`.

[source](https://stackoverflow.com/a/24689738/535590)
